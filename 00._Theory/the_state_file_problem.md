# The state file

A reminder about the Terraform state file:

- Stored locally.

- Always in JSON. 

- Named terraform.tfstate

Is used to:

* keep track of references to existing resources 
* maintain the dependency graph between services

It is stored locally by default, though everyone in a team should have the latest version.

---

# Why using a VCS is no good

You should not push the state file into git because it risks:

* mergeing two versions of the file incorrectly, resulting in an invalid file.

* exposing secrets about your system which can compromise security.

---

# The state file - The glaring problem

The state file must be up to date when running `terraform apply`, otherwise "state drift" will lead to big problems. 

If a change happens outside of Terraform then state drift can be ammened with `terraform refresh`.

A **major** downside with Terraform is how there ufortunately is no standardized way to deal with state file. 

Note: This problem is easily solved with coordination in your groups but let's look at how they deal with them in large companies. But you might face this problem after convincing your next job to try out Terraform. 

---

# The state file - Potential problems

These problems occur in large SRE or operations teams:

**Locking**

Ensures single concurrent access. 

**Version Consistency**

Ensuring users apply changes against the latest state version.

**Provide a write mechanism**

Consider a CI/CD pipeline where runners are destroyed after use. If the pipeline updates the infrastructure then it should be able to save the state changes.

---

# Common Solution - Using cloud storage with lock support - I

Storing it only solves half of the problem. 

A full solution must provide a locking mechanism so that only 1 developer can change the same workspace at a time. 

Though any cloud storage solution that provides a locking mechanism could do (might require some scripting to call lock and unlock) consider what it would mean to you if a state file remains locked because of an error. 

---

# Common Solution - Using Cloud Storage with Lock Support - II

- [Terraform Cloud](https://www.hashicorp.com/products/terraform?product_intent=terraform)

- [Google Cloud Storage](https://cloud.google.com/docs/terraform/resource-management/store-state)

- AWS S3 with DynamoDB (for lock handling)

- [Azure Storage Account](https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli#4-understand-state-locking)

Remember that the problem is that there is no standardized, agreed-upon way to solve this issue. 