variable "resource_prefix" {
  type        = string
  description = "全てのリソースの名前のPrefixに指定される"
}

variable "schedule_expression" {
  type        = string
  description = <<EOF
更新処理を行う時間をcron形式で指定する
例: cron(37 10 11 5 ? 2022)"
  EOF
}

variable "modify_parameters" {
  type        = map(any)
  description = <<EOF
step functionに付与するIAM ROLEのarnを指定する
例: modify_parameters = {
      DbInstanceIdentifier = "(RDSのIdentifierを指定)"
      DbInstanceClass      = "db.t3.large"
    }
EOF
}

variable "sfn_iam_role_arn" {
  type        = string
  description = "step functionに付与するIAM ROLEのarnを指定する"
}

variable "cloudwatch_event_iam_role_arn" {
  type        = string
  description = "step functionに付与するIAM ROLEのarnを指定する"
}
