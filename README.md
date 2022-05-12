# terraform-module-template

このリポジトリはTerraformのmoduleを作成する際のテンプレートである。

このリポジトリを使用してリポジトリを作成するとTerraformリポジトリ作成時に便利なコマンドがデフォルトで使用できるようになる。

## デフォルトで付随する機能

### 開発時
- .editorconfigによるコードフォーマットの統一

### git commit時
- terraform fmtやvalidateによる安全確認
- terraform-docsによるドキュメント作成
- master、mainブランチのPush禁止
- 秘密鍵、AWSのアクセスキー混入のブロック

### github action
- terraform fmtやvalidateによる安全確認
- Terraformのドキュメント更新

## 実行環境
- terraform-docs
  - version v0.16.0 1f686b1 darwin/amd64
- go
  - go1.17.5 darwin/amd64
- pre-commit
  - pre-commit 2.16.0

## 環境構築

```
$ pre-commit install
$ yarn install
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```
module "hacomono-terraform-template" {
  source = "git@github.com:hacomono/hacomono-terraform-template.git"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_test"></a> [test](#output\_test) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
