  850  perl -e 'use Bio::KBase::AuthIntegration::Client; my $c = Bio::KBase::AuthIntegration::Client->new("http://localhost:9999"); $c->test_noauth();'
  851  perl -e 'use Bio::KBase::AuthIntegration::Client; my $c = Bio::KBase::AuthIntegration::Client->new("http://localhost:9999"); print $c->test_noauth();'
  852  perl -e 'use Bio::KBase::AuthIntegration::Client; my $c = Bio::KBase::AuthIntegration::Client->new("http://localhost:9999"); print $c->test_auth_optional();'
  853  perl -e 'use Bio::KBase::AuthIntegration::Client; my $c = Bio::KBase::AuthIntegration::Client->new("http://localhost:9999"); print $c->test_auth_required();'
  854  kbase-login
  855  kb-login
  856  ls /kb/deployment/bin/*login*
  857  history
  858  history | tail -10 > dev_container/modules/auth_integration/client_tests/scratch.t
  859  history | tail -10 > scratch.t
