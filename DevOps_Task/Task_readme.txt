This is a text file to explain the solution 


Dockerfile: Dockerfile for the go application

docker-compose.yaml: The docker-compose file for the app and redis dependency

vagrant_file.erb: We are passing this erb file as template to create the Vagrantfile for booting VM.

vagrant_steps.sh : This is the file where the bash script is present to install vagrant(if not available) and boots the VM

vagrant_setup.yaml: This is the ansible playbook to setup and deploy  the application in the VM 



Kuberenetes:

namespace.yaml : To create the namespace "demo-ops"

app_deployment.yml: Deployment resource definition for application along with resource limits.

redis_service.yaml: Defines the redis deployment and also creates a service that can be accessed by the application.