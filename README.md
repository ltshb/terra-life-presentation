# Terra-life Presentation Examples

This repository contains CLI and code examples for my Terra-Life presentation at swisstopo on the 2nd of April 2026.

## Terramate CLI examples

```bash


terramate list --changed --why


terramate list --changed --run-order


terramate run -- terraform plan


terramate run --continue-on-error -- terraform plan -detailed-exitcode


terramate run --continue-on-error --changed -j 10 -- terraform plan -detailed-exitcode


terramate run --continue-on-error --changed -j 10 -- terraform apply -auto-approve


terramate experimental run-graph


terramate run --changed --continue-on-error -j 10 -- terraform plan -detailed-exitcode -out=plan.out.tfstate


terramate run --changed --continue-on-error -j 10 -- terraform apply -auto-approve plan.out.tfstate


terramate create --all-terraform


terramate generate

```
