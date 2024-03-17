
## Let's get started - creating a Terraform project

In this folder try to run:

```bash
$ terraform init
```

It fails and the first line of error it outputs tells us:

```
Terraform initialized in an empty directory!
```

That's odd because I, Mr. README.md, am in this folder. The directory isn't empty! 

Well, according to Terraform the directory is empty because it is missing a config file. 

Let's create one. Simply create a file called `main.tf` and now you should be able to run `terraform init`. 

**Moral**: Terraform needs a config file to welcome it otherwise it feels lost. Make sure to always run Terraform commands where `main.tf` is located. 

[Next Lesson =>](./01._Workspaces.md)

