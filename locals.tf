locals {
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition

  # Add current user as key owner
  key_owners = concat([data.aws_iam_session_context.current.issuer_arn], var.key_owners)


  aliases = { for k, v in toset(var.aliases) : k => { name = v } }

}
