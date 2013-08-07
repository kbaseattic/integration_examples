package Bio::KBase::AuthIntegration::AuthIntegrationImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

AuthIntegration

=head1 DESCRIPTION



=cut

#BEGIN_HEADER

use Data::Dumper;

#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR
    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 test_noauth

  $s = $obj->test_noauth()

=over 4

=item Parameter and return types

=begin html

<pre>
$s is a string

</pre>

=end html

=begin text

$s is a string


=end text



=item Description



=back

=cut

sub test_noauth
{
    my $self = shift;

    my $ctx = $Bio::KBase::AuthIntegration::Service::CallContext;
    my($s);
    #BEGIN test_noauth

    $s = Dumper $ctx;

    #END test_noauth
    my @_bad_returns;
    (!ref($s)) or push(@_bad_returns, "Invalid type for return variable \"s\" (value was \"$s\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to test_noauth:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'test_noauth');
    }
    return($s);
}




=head2 test_auth_optional

  $s = $obj->test_auth_optional()

=over 4

=item Parameter and return types

=begin html

<pre>
$s is a string

</pre>

=end html

=begin text

$s is a string


=end text



=item Description



=back

=cut

sub test_auth_optional
{
    my $self = shift;

    my $ctx = $Bio::KBase::AuthIntegration::Service::CallContext;
    my($s);
    #BEGIN test_auth_optional

    $s = Dumper $ctx;

    #END test_auth_optional
    my @_bad_returns;
    (!ref($s)) or push(@_bad_returns, "Invalid type for return variable \"s\" (value was \"$s\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to test_auth_optional:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'test_auth_optional');
    }
    return($s);
}




=head2 test_auth_required

  $s = $obj->test_auth_required()

=over 4

=item Parameter and return types

=begin html

<pre>
$s is a string

</pre>

=end html

=begin text

$s is a string


=end text



=item Description



=back

=cut

sub test_auth_required
{
    my $self = shift;

    my $ctx = $Bio::KBase::AuthIntegration::Service::CallContext;
    my($s);
    #BEGIN test_auth_required

    $s = Dumper $ctx;

    #END test_auth_required
    my @_bad_returns;
    (!ref($s)) or push(@_bad_returns, "Invalid type for return variable \"s\" (value was \"$s\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to test_auth_required:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'test_auth_required');
    }
    return($s);
}




=head2 version 

  $return = $obj->version()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module version. This is a Semantic Versioning number.

=back

=cut

sub version {
    return $VERSION;
}

=head1 TYPES



=cut

1;
