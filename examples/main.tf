provider "aws" {
  region = "eu-central-1"
}

# Also create a new sns topic
module "with-new-sns-topic" {
  source               = "../"
  email_addresses_list = ["my.test@axa.com"]
  sns_topic = {
    topic_name   = "mytest"
    display_name = "mytest"
    policy       = null
    kms_key_id   = "myKmsKeyId"
  }
  tags = { "global.env" = "test" }
}

# Use an existing topic
module "with-existing-sns-topic" {
  source               = "../"
  email_addresses_list = ["my.test@axa.com", "my.test2@axa.com"]
  sns_topic_arn        = "mySnsTopicArn"
  tags                 = { "global.env" = "test" }
}