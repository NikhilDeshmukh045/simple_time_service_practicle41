
# simple_time_service_practicle41

Created this repo which contains Dockerfile and application code file written in Python(Flask) which creates application package in containerized image. With this it also has Terraform script to setup AWS infrastructure to deploy application with the help of containerized image.



## Creation of docker image

To create docker image we can use below statements

```bash
  docker build -t <registry-name>/simple-time-service:<image-tag> -f app/Dockerfile .
```
To push docker image to public docker registry(Dockerhub).

```bash
docker push <registry-name>/simple-time-service:<image-tag>
```

## Creation of AWS infra with Terraform script

### Pre-requisites for Terraform script execution

AWS CLI Config File (~/.aws/credentials)

```bash
aws configure
```
This creates:

1. ~/.aws/credentials:
```
[default]
aws_access_key_id = your-access-key
aws_secret_access_key = your-secret-key
```
2. ~/.aws/config:
```
[default]
region = your-region
```

NOTE : Terraform will automatically pick this up.

To create AWS infra
```bash
cd iac
```
```bash
terraform init
```
```bash
terraform apply
```

## Extra
Also I have created one jenkins job which creates docker image and push it to public docker repository(Dockerhub).

We can import jenkins job config xml file, so it will create pipeline job.

```bash
Refer directory `jenkins-job-config`
Here I have kept config.xml file
```

Inside app directory I have Jenkinsfile which has script which will take care of docker image creation and push to dockerhub.


