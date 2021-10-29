# __OWNER__ Stack __SERVICE_NAME__


## Requirements
- cmake
- docker
- aws-cli

## Considerations for customizations

First of all, you must rename some variables in the Makefile and README file

```
OWNER          = __OWNER__
SERVICE_NAME   = __SERVICE_NAME__
```

```
# __OWNER__ Stack __SERVICE_NAME__
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
make ts.cmd COMMAND="terraspace plan fs"
make ts.cmd COMMAND="terraspace up fs -y"
make ts.cmd COMMAND="terraspace down fs"
```

Using the ENV environment variable we can define the environment before the execution of terraspace. By default the ENV environment variable contains the value of dev
```
make ts.cmd COMMAND="terraspace plan fs" ENV=stg
make ts.cmd COMMAND="terraspace up fs -y" ENV=stg
make ts.cmd COMMAND="terraspace down fs" ENV=stg
```

Using the AWS_REGION environment variable we can define the environment before the execution of terraspace. By default the AWS_REGION environment variable contains the value of us-west-2
```
make ts.cmd COMMAND="terraspace plan fs" ENV=stg AWS_REGION=us-east-1
make ts.cmd COMMAND="terraspace up fs -y" ENV=stg AWS_REGION=us-east-1
make ts.cmd COMMAND="terraspace down fs" ENV=stg AWS_REGION=us-east-1
```

## Environment  Variables

Display values of environment variables at start of execution
```
make ts.cmd COMMAND="terraspace plan fs"
------------------------ Environment  Variables ------------------------
AWS_PROFILE: default
AWS_REGION : us-west-2
ENV        : dev
OWNER      : endor
------------------------------------------------------------------------
Building .terraspace-cache/us-west-2/dev/stacks/fs
Built in .terraspace-cache/us-west-2/dev/stacks/fs
Current directory: .terraspace-cache/us-west-2/dev/stacks/fs
=> terraform init -get -input=false >> /tmp/terraspace/log/init/fs.log
=> terraform plan -input=false
Acquiring state lock. This may take a few moments...
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

------------------------------------------------------------------------
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.this will be created
  + resource "random_pet" "this" {
      + id     = (known after apply)
      + length = 2
    }

  # module.bucket.aws_s3_bucket.this will be created
  + resource "aws_s3_bucket" "this" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }
Plan: 2 to add, 0 to change, 0 to destroy.
------------------------------------------------------------------------
Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

## Docs
- [Terraspace Framework](https://terraspace.cloud/)
- [Terrafile](https://terraspace.cloud/docs/terrafile/)
- [Terraform](https://www.terraform.io/)