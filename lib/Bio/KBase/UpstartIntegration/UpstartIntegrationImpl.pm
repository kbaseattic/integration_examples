package Bio::KBase::UpstartIntegration::UpstartIntegrationImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

UpstartIntegration

=head1 DESCRIPTION

Module to demonstrate creation of upstart scripts

=cut

#BEGIN_HEADER
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



=head2 is_running

  $status = $obj->is_running()

=over 4

=item Parameter and return types

=begin html

<pre>
$status is a string

</pre>

=end html

=begin text

$status is a string


=end text



=item Description



=back

=cut

sub is_running
{
    my $self = shift;

    my $ctx = $Bio::KBase::UpstartIntegration::Service::CallContext;
    my($status);
    #BEGIN is_running
	$status = "running";
    #END is_running
    my @_bad_returns;
    (!ref($status)) or push(@_bad_returns, "Invalid type for return variable \"status\" (value was \"$status\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to is_running:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'is_running');
    }
    return($status);
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
