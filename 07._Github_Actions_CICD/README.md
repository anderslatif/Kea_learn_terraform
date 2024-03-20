# Github Actions CI/CD

Dislaimer: You can't solve this assignment with an Azure For Students account. But keep reading. 


## The video

This is an amazing video that guides you through the process:

https://www.youtube.com/watch?v=uEn4pE4wDiU

The amazing thing is that he constantly shows how to find answers and talks about the naming conventions that he follows and his motivation for them. 

## Github Actions

Uses the official Hashicorp Github Action from the marketplace:

https://github.com/hashicorp/setup-terraform

Requires to set up secrets like which can be retrieved like this:

```bash
$ az account list --output table
```

## The Azure for Student problem

We can't run Terraform in CI/CD because to give it permission would require generating a Service Principal which isn't possible in Azure For Student accounts. 

You have two valid options:

1. Watch the videos and learn from them. Know that this is the way to go if you were to create a professional setup with Terraform in CI/CD. 

2. Connect your credit card with your Azure account and turn it into a Pay As You Go account. 

Let me reiterate, both are valid!
