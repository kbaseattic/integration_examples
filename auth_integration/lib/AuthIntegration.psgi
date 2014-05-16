use Bio::KBase::AuthIntegration::AuthIntegrationImpl;

use Bio::KBase::AuthIntegration::Service;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = Bio::KBase::AuthIntegration::AuthIntegrationImpl->new;
    push(@dispatch, 'AuthIntegration' => $obj);
}


my $server = Bio::KBase::AuthIntegration::Service->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
