locals {
  encode_cron = replace(
    replace(
      replace(
        replace(
          replace(
            var.schedule_expression, " ", "-"
          ), "(", "-"
        ), ")", ""
      ),
    "?", "q"), # Questionのq
  "*", "a")    # AsteriskのA

  default_parameters = {
    ApplyImmediately = true
  }
}
