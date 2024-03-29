package Bio::KBase::AuthIntegration::Service;

use Data::Dumper;
use Moose;
use Bio::KBase::AuthToken;

extends 'RPC::Any::Server::JSONRPC::PSGI';

has 'instance_dispatch' => (is => 'ro', isa => 'HashRef');
has 'user_auth' => (is => 'ro', isa => 'UserAuth');
has 'valid_methods' => (is => 'ro', isa => 'HashRef', lazy => 1,
			builder => '_build_valid_methods');

our $CallContext;

our %return_counts = (
        'test_noauth' => 1,
        'test_auth_optional' => 1,
        'test_auth_required' => 1,
        'version' => 1,
);

our %method_authentication = (
        'test_noauth' => 'none',
        'test_auth_optional' => 'optional',
        'test_auth_required' => 'required',
);


sub _build_valid_methods
{
    my($self) = @_;
    my $methods = {
        'test_noauth' => 1,
        'test_auth_optional' => 1,
        'test_auth_required' => 1,
        'version' => 1,
    };
    return $methods;
}

sub call_method {
    my ($self, $data, $method_info) = @_;

    my ($module, $method) = @$method_info{qw(module method)};
    
    my $ctx = Bio::KBase::AuthIntegration::ServiceContext->new(client_ip => $self->_plack_req->address);
    
    my $args = $data->{arguments};

{
    # Service AuthIntegration requires authentication.

    my $method_auth = $method_authentication{$method};
    $ctx->authenticated(0);
    if ($method_auth eq 'none')
    {
	# No authentication required here. Move along.
    }
    else
    {
	my $token = $self->_plack_req->header("Authorization");

	if (!$token && $method_auth eq 'required')
	{
	    $self->exception('PerlError', "Authentication required for AuthIntegration but no authentication header was passed");
	}

	my $auth_token = Bio::KBase::AuthToken->new(token => $token, ignore_authrc => 1);
	my $valid = $auth_token->validate();
	# Only throw an exception if authentication was required and it fails
	if ($method_auth eq 'required' && !$valid)
	{
	    $self->exception('PerlError', "Token validation failed: " . $auth_token->error_message);
	} elsif ($valid) {
	    $ctx->authenticated(1);
	    $ctx->user_id($auth_token->user_id);
	    $ctx->token( $token);
	}
	$ctx->authenticated(1);
	$ctx->user_id($auth_token->user_id);
	$ctx->token( $token);
    }
}
    
    my $new_isa = $self->get_package_isa($module);
    no strict 'refs';
    local @{"${module}::ISA"} = @$new_isa;
    local $CallContext = $ctx;
    my @result;
    {
	my $err;
	eval {
	    @result = $module->$method(@{ $data->{arguments} });
	};
	if ($@)
	{
	    #
	    # Reraise the string version of the exception because
	    # the RPC lib can't handle exception objects (yet).
	    #
	    my $err = $@;
	    my $str = "$err";
	    $str =~ s/Bio::KBase::CDMI::Service::call_method.*//s;
	    $str =~ s/^/>\t/mg;
	    die "The JSONRPC server invocation of the method \"$method\" failed with the following error:\n" . $str;
	}
    }
    my $result;
    if ($return_counts{$method} == 1)
    {
        $result = [[$result[0]]];
    }
    else
    {
        $result = \@result;
    }
    return $result;
}


sub get_method
{
    my ($self, $data) = @_;
    
    my $full_name = $data->{method};
    
    $full_name =~ /^(\S+)\.([^\.]+)$/;
    my ($package, $method) = ($1, $2);
    
    if (!$package || !$method) {
	$self->exception('NoSuchMethod',
			 "'$full_name' is not a valid method. It must"
			 . " contain a package name, followed by a period,"
			 . " followed by a method name.");
    }

    if (!$self->valid_methods->{$method})
    {
	$self->exception('NoSuchMethod',
			 "'$method' is not a valid method in service AuthIntegration.");
    }
	
    my $inst = $self->instance_dispatch->{$package};
    my $module;
    if ($inst)
    {
	$module = $inst;
    }
    else
    {
	$module = $self->get_module($package);
	if (!$module) {
	    $self->exception('NoSuchMethod',
			     "There is no method package named '$package'.");
	}
	
	Class::MOP::load_class($module);
    }
    
    if (!$module->can($method)) {
	$self->exception('NoSuchMethod',
			 "There is no method named '$method' in the"
			 . " '$package' package.");
    }
    
    return { module => $module, method => $method };
}

package Bio::KBase::AuthIntegration::ServiceContext;

use strict;

=head1 NAME

Bio::KBase::AuthIntegration::ServiceContext

head1 DESCRIPTION

A KB RPC context contains information about the invoker of this
service. If it is an authenticated service the authenticated user
record is available via $context->user. The client IP address
is available via $context->client_ip.

=cut

use base 'Class::Accessor';

__PACKAGE__->mk_accessors(qw(user_id client_ip authenticated token));

sub new
{
    my($class, %opts) = @_;
    
    my $self = {
	%opts,
    };
    return bless $self, $class;
}

1;
