# Letto (infrastructure)

Infrastructure-as-code for Letto.

## Status

[ABANDONED - REPLACED BY webtask.io] A serverless platform for developers with a great UX 

## Prerequisites

- Terraform
- [pass](https://www.passwordstore.org/)
- DigitalOcean API token stored in _pass_ under `digitalocean-api-token`.
- A SSH key under `~/.ssh/id_rsa+digitalocean` authorized on your DigitalOcean account.

## Howto

```
bin/init
bin/plan
bin/apply
bin/state
bin/destroy
```

_This setup was made using [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean)._
