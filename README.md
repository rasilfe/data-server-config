# What is Data Server Config?
Data Server Config is an app template with the most popular frameworks(SPRING), designed and built with security in mind. (If you are curious about what makes an Spring Cloud Config, please check out [this page](https://github.com/spring-cloud/spring-cloud-config/blob/main/README.adoc)).

## How to get started
To get started, clone the repository by clicking "CLONE" button, or through the command line (`git clone https://github.com/rasilfe/data-server-config.git`).

# Prerequisites
## Security
By default, the username and password are as **DEVELOP**, change it in the `/src/resource/application.yaml` 

## Package
```
mvn package .
```

# Installation
## Create Image from Dockerfile
```
docker build --tag data-server-config . 
```

## Example
### ENV
- PORT - Number of port expose
- GIT - Uri or Directory Local(.git)  
```
version: "3.8"

services:
data-server-config:
container_name: "container_name"
image: data-server-config
ports:
- "8888:8888"
environment:
- PORT=8888
- GIT=https://github.com/rasilfe/server-config.git
```

# Test
### Request
```
curl -u {username}:{password} http://{url_data_config_service}:{port}/{application}/{profile}
```

### Response
```
{
    "name": "{APPLICATION_NAME}",
    "profiles": [
        "{PROFILE}"
    ],
    "label": null,
    "version": "87131512b40f0530fba753ab040ab80e010a4dee",
    "state": null,
    "propertySources": [
        "MACHINE_NAME"
    ]
}
```