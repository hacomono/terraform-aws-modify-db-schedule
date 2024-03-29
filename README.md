# terraform-module-template

このリポジトリRDSのインスタンス更新対応をスケジューリングするためのTerraform moduleである。

このリポジトリで生成されるリソースはStepFunctionとEventBrigeになります。

## 実行環境
- terraform-docs
  - version v0.16.0 1f686b1 darwin/amd64
- go
  - go1.17.5 darwin/amd64
- pre-commit
  - pre-commit 2.16.0

## 初期設定

```
$ yarn install
$ pre-commit install
$ yarn husky init
$ yarn husky install
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```
module "terraform-aws-modify-db-schedule" {
  source = "git@github.com:hacomono/terraform-aws-modify-db-schedule.git"

  resource_prefix               = "terraform-aws-modify-db-schedule"
  schedule_expression           = "cron(37 10 11 5 ? 2022)"
  sfn_iam_role_arn              = "arn:aws:iam::123456789012:role/sfn-aws-modify-db-schedule"
  cloudwatch_event_iam_role_arn = "arn:aws:iam::123456789012:role/cloudwatch-aws-modify-db-schedule"
  modify_parameters             = {
    DbInstanceIdentifier = "your-db-Identifier"
    DbInstanceClass      = "db.t3.large"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.modify-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.modify-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_sfn_state_machine.modify_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine) | resource |
| [aws_db_instance.check_existence_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_event_iam_role_arn"></a> [cloudwatch\_event\_iam\_role\_arn](#input\_cloudwatch\_event\_iam\_role\_arn) | step functionに付与するIAM ROLEのarnを指定する | `string` | n/a | yes |
| <a name="input_modify_parameters"></a> [modify\_parameters](#input\_modify\_parameters) | step functionに付与するIAM ROLEのarnを指定する<br>例: modify\_parameters = {<br>      DbInstanceIdentifier = "(RDSのIdentifierを指定)"<br>      DbInstanceClass      = "db.t3.large"<br>    } | `map(any)` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | 全てのリソースの名前のPrefixに指定される | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | 更新処理を行う時間をcron形式で指定する<br>例: cron(37 10 11 5 ? 2022)" | `string` | n/a | yes |
| <a name="input_sfn_iam_role_arn"></a> [sfn\_iam\_role\_arn](#input\_sfn\_iam\_role\_arn) | step functionに付与するIAM ROLEのarnを指定する | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
