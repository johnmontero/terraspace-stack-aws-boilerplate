# __OWNER__ Stack __SERVICE_NAME__


## Requirements
- cmake
- docker
- aws-cli

## Considerations for customizations

First you need rename some variables , run this commands inside your project folder

```
LC_ALL=C find ./ -type f -exec sed -i '' -e "s/__OWNER__/wakanda/" {} \;
LC_ALL=C find ./ -type f -exec sed -i '' -e "s/__SERVICE_NAME__/vibranium/" {} \;
```

## Help
- make
- make help

## Comandos
```
Target           Help                                    Usage
------           ----                                    -----
ct.build.image   Build image for development.            make ct.build.image
ct.shell         Connect to the container by shell.      make ct.shell
ts.cmd           Execute terraspace command.             make ts.cmd
```

## Workflow

Run the first time or every time the Gemfile is modified
```
make ct.build.image
```

Execution of terraspace commands are executed using ts.cmd
```
make ts.cmd COMMAND="terraspace plan filestorage"
make ts.cmd COMMAND="terraspace up filestorage -y"
make ts.cmd COMMAND="terraspace down filestorage"
```

Using the ENV environment variable we can define the environment before the execution of terraspace. By default the ENV environment variable contains the value of dev
```
make ts.cmd COMMAND="terraspace plan filestorage" ENV=stg
make ts.cmd COMMAND="terraspace up filestorage -y" ENV=stg
make ts.cmd COMMAND="terraspace down filestorage" ENV=stg
```

Using the AWS_REGION environment variable we can define the environment before the execution of terraspace. By default the AWS_REGION environment variable contains the value of us-west-2
```
make ts.cmd COMMAND="terraspace plan filestorage" ENV=stg AWS_REGION=us-east-1
make ts.cmd COMMAND="terraspace up filestorage -y" ENV=stg AWS_REGION=us-east-1
make ts.cmd COMMAND="terraspace down filestorage" ENV=stg AWS_REGION=us-east-1
```

## Docs
- [Terraspace Framework](https://terraspace.cloud/)
- [Terrafile](https://terraspace.cloud/docs/terrafile/)
- [Terraform](https://www.terraform.io/)