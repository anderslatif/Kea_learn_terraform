# Terraform Hands-on

The goal of this repository is to teach Terraform with a focus on Azure.

Each folder in this repository is its own Terraform setup. 

### Progressing through the learning track

The concept is that you progress through each subfolder starting from `01`. Folder `00` relates to Infrastructure as Code but isn't strictly necessary to complete to go through the track.

I recommend studying each setup in chronological order. Each folder contain a README with explanations and instructions. 

[00._Vagrant](./00._Vagrant/): Not a required part of the track but it will introduce you to a rudimentary way to work with provisioning. 

[01._Setup_And_Basics](./01._Setup_And_Basics/): Introduces you to how to setup a new Terraform project, work with workspaces and some language functionalities of HCL.

[02._Basic_VM](./02._Basic_VM/): Provides a quick and dirty solution to creating a virtual machine in cloud. 

But it contain the desired virtual machine password in plain text. The goal is to fix the problem.

[03._VM_With_SSH](./03._VM_With_SSH/): Solves the previous password problem in a better way by using SSH keys.

[04._Terraform_Functions/](./04._Terraform_Functions/) focuses on Azure Functions for creating serverless code.


### How to run

Make sure you have the fulfilled [the prerequisites](./prerequisites.md).

Inside of each subfolder read the README.md on how to get started. 

Make sure that you are in the root of each Terraform project when running Terraform commands. 

You are in the right place if you can do this:

```bash
$ ls main.tf  
```

1. If the Terraform project is valid then run this to initialize the project:

```bash
$ terraform init
```

2. Once you are ready you can optionally run `terraform fmt`, `terraform validate` and then create a plan:

```bash
$ terraform plan
```

3. If you are sure that you would like to provision the resouces then run apply:

```bash
$ terraform apply
```

You will be shown a plan of what will be added, changed and/or destroyed. 

It is recommended not to bypass with the `terraform apply -auto-approve` command. 

This gives you one last chance to spot potential errors. 

4. Once you are done with an exercise, remember to tear down the resources including the resource groups:

```bash
$ terraform destroy
```

Make sure that the above command works. Sometimes it will error out and it does it slowly by timing out. 

*Just Terraform things, I guess.*

If everything else fails , then manually delete the service(s) and/or resource group in Azure Portal.


## Further resources


