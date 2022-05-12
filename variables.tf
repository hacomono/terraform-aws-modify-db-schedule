variable "resource_prefix" {
  type = string
}

variable "schedule_expression" {
  type = string
}

variable "modify_parameters" {
  type = map(any)
}

variable "sfn_iam_role_arn" {
  type = string
}

variable "cloudwatch_event_iam_role_arn" {
  type = string
}
