provider "aws" {
  region = var.region
}

resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}
locals {
  name = var.name == "sudo-key" ? "sudo-key-${random_string.random.result}" : var.name

  current_identity = data.aws_caller_identity.current.arn

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-kms"
  }
}

data "aws_caller_identity" "current" {}

module "kms_key_basic" {
  source = "../.."
}

module "kms_key_complete" {
  source                  = "../.."
  create                  = false
  deletion_window_in_days = 7
  description             = "Complete key example showing various configurations available"
  enable_key_rotation     = false
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  # Policy
  enable_default_policy             = true
  key_owners                        = [local.current_identity]
  key_administrators                = [local.current_identity]
  key_users                         = [local.current_identity]
  key_service_users                 = [local.current_identity]
  key_service_roles_for_autoscaling = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]

  # Aliases
  aliases = ["one", "foo/bar"]

  aliases_use_name_prefix = true

  # Grants
  grants = {
    lambda = {
      grantee_principal = aws_iam_role.test.arn
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }

  tags = local.tags
}

resource "aws_iam_role" "test" {
  name_prefix = local.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
