# Prerequisites

## Terraform installation

<a href="https://developer.hashicorp.com/terraform/install">Terraform download</a>

Ensure that terraform has been installed:

```bash
$ terraform --version
```

<!-- todo otherwise ... link -->

## Azure CLI installation
<a href="https://learn.microsoft.com/en-us/cli/azure/install-azure-cli">Azure CLI download</a>

Ensure that `az` has been installed:

```bash
$ az --version
```

``Note: If you used a terminal to install the Azure CLI, remember to close it and open a new terminal window before running any `az` commands.``

<!-- todo otherwise ... link -->

### az login check
Ensure that you are logged in to Azure via `az`. You should see at least one object in the array with your account info as the key-value pairs:

```bash
$ az account list
```

## NodeJS
Ensure that you have NodeJS installed:

<a href="https://nodejs.org/en/download/package-manager">NodeJS download</a>