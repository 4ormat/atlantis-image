FROM dwsr/terragrunt-ci:0.11.14-20190622 AS tg
FROM runatlantis/atlantis:v0.8.2

ENV TF_INPUT=0 TF_IN_AUTOMATION=1 TF_CLI_ARGS="-plugin-dir=/tf-providers -get-plugins=false" DISABLE_CHECKPOINT=1

COPY --from=tg /bin/terragrunt /bin/terragrunt
COPY --from=tg /tf-providers/ /tf-providers
