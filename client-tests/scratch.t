source /kb/deployment/user-env.sh
perl -e 'use Bio::KBase::UpstartIntegration::Client; $obj=Bio::KBase::UpstartIntegration::Client->new("http://localhost:9998"); $status = $obj->is_running; print "status: $status\n";'

