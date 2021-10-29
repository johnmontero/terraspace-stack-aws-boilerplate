resource "random_pet" "this" {
  length = 2 # using 2, since default separator is '-', also account name can only be 24 characters, and lowercase letters
  separator = ""# a blank string separator because azure storage accounts dont support - characters
}

module "bucket" {
  source     = "../../modules/s3"
  bucket     = "<%= app_owner %>.<%= expansion(':ENV.fs') %>.${random_pet.this.id}"
  acl        = var.acl
}