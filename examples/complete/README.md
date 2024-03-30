# Complete AWS KMS Example

Configuration in this directory creates:

- Complete KMS key example with key policy, aliases, and grants
- External KMS key example
- Default KMS key example with default policy
- Disable KMS key example

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.33 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.33 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms_key_basic"></a> [kms\_key\_basic](#module\_kms\_key\_basic) | ../.. | n/a |
| <a name="module_kms_key_complete"></a> [kms\_key\_complete](#module\_kms\_key\_complete) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (optional) describe your variable | `string` | `"sudo-key"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to test | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_basic_key_arn"></a> [basic\_key\_arn](#output\_basic\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_basic_key_id"></a> [basic\_key\_id](#output\_basic\_key\_id) | The globally unique identifier for the key |
| <a name="output_complete_key_arn"></a> [complete\_key\_arn](#output\_complete\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_complete_key_id"></a> [complete\_key\_id](#output\_complete\_key\_id) | The globally unique identifier for the key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-kms/blob/master/LICENSE).
