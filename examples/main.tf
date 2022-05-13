module "terraform-aws-modify-db-schedule" {
  source = "../"

  resource_prefix               = "terraform-aws-modify-db-schedule"
  schedule_expression           = "cron(37 10 11 5 ? 2022)"
  sfn_iam_role_arn              = var.sfn_iam_role_arn
  cloudwatch_event_iam_role_arn = var.cloudwatch_event_iam_role_arn
  modify_parameters = {
    DbInstanceIdentifier = var.DbInstanceIdentifier
    DbInstanceClass      = "db.t3.large"
  }
}
