# Docs: https://www.terraform.io/docs/providers/aws/index.html
#
# If AWS_PROFILE and AWS_REGION is set, then the provider is optional.  Here's an example anyway:
#
provider "aws" {
    region  = "<%= aws_region %>"
    default_tags {
        tags = {
            Owner = "<%= app_owner %>"
            Env  = "<%= Terraspace.env %>"
        }
    }
}
