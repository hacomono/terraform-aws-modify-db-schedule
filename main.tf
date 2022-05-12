/**
 * Usage:
 *
 * ```
 * module "terraform-modify-db-schedule" {
 *   source = "git@github.com:hacomono/terraform-modify-db-schedule.git"
 *
 *   resource_prefix               = "terraform-modify-db-schedule"
 *   schedule_expression           = "cron(37 10 11 5 ? 2022)"
 *   sfn_iam_role_arn              = "arn:aws:iam::123456789012:role/sfn-modify-db-schedule"
 *   cloudwatch_event_iam_role_arn = "arn:aws:iam::123456789012:role/cloudwatch-event-db-schedule"
 *   modify_parameters             = {
 *     DbInstanceIdentifier = "h-hacomono-develop01-db"
 *     DbInstanceClass      = "db.t3.large"
 *   }
 * }
 * ```
 */

resource "aws_cloudwatch_event_rule" "modify-db" {
  name                = "${var.resource_prefix}-${local.encode_cron}"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "modify-db" {
  rule      = aws_cloudwatch_event_rule.modify-db.name
  target_id = "SendToStepFunction"
  arn       = aws_sfn_state_machine.modify_db_instance.arn
  role_arn  = var.cloudwatch_event_iam_role_arn

  input_transformer {
    input_paths = {
      InputPath = "$.cloudwatch_event"
    }
    input_template = jsonencode({
      "description" : "Modify ${var.modify_parameters.DbInstanceIdentifier}"
    })
  }
}

resource "aws_sfn_state_machine" "modify_db_instance" {
  name     = "${var.resource_prefix}-${local.encode_cron}"
  role_arn = var.sfn_iam_role_arn

  definition = <<EOF
{
  "Comment": "Modify DB Instances",
  "StartAt": "ModifyDBInstance",
  "States": {
    "ModifyDBInstance": {
      "Type": "Task",
      "End": true,
      "Parameters": ${jsonencode(merge(var.modify_parameters, local.default_parameters))},
      "Resource": "arn:aws:states:::aws-sdk:docdb:modifyDBInstance"
    }
  }
}
EOF
}
