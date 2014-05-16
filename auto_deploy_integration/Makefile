VARS_OLD := $(.VARIABLES)
TOP_DIR = ../..
DEPLOY_RUNTIME ?= /kb/runtime
TARGET ?= /kb/deployment

SERVICE_SPEC = auto_deploy.spec	
SERVICE_NAME = AutoDeploy
SERVICE_PORT = 12121
SERVICE_DIR  = auto_deploy

default:

vars:
	@echo "nothing to do for default"
	$(foreach v,                                        \
	$(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES)), \
	$(info $(v) = $($(v))))

deploy: deploy-client deploy-service
	@echo "nothing to do for deploy"

deploy-client: vars
	@echo "nothing to do for deploy-client"

deploy-service: vars
	@echo "nothing to do for deploy-service"

test:
	@echo "nothing to do for test"


