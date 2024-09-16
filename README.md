- [1. Overview](#1-overview)
- [2. Quick Start](#2-quick-start)
  - [2.1. Prerequisites](#21-prerequisites)
  - [2.2. Step 1: Clone the repository](#22-step-1-clone-the-repository)
  - [2.3. Step 2: Configure Terraform credentials](#23-step-2-configure-terraform-credentials)
  - [2.4. Step 3: Initialize and apply Terraform](#24-step-3-initialize-and-apply-terraform)
- [3. Pre-commit Hooks](#3-pre-commit-hooks)
  - [3.1. Step 1: Install Pre-commit](#31-step-1-install-pre-commit)
  - [3.2. Step 2: Install the Hooks](#32-step-2-install-the-hooks)
  - [3.3. Configured Hooks](#33-configured-hooks)
  - [3.4. Step 3: Running Pre-commit Hooks Manually](#34-step-3-running-pre-commit-hooks-manually)
  - [3.5. Step 4: Updating Hooks](#35-step-4-updating-hooks)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## 1. Overview
The aim of this project is to deploy a functional infrastructure as well as a bastion in the cloud provider OVH, in compliance with best practices from a configuration and security point of view.

## 2. Quick Start

### 2.1. Prerequisites

Before starting, ensure that the following are installed on your machine:
- [Terraform][Terraform DL] (Please see the [Requirements section](#3-requirements))
- The necessary credentials to configure the OVH API (application key, application secret, consumer key) -> Available on **Passbolt**

### 2.2. Step 1: Clone the repository

Start by cloning this repository to your local machine:

```bash
git clone https://github.com/Mysticx69/OVH-BASTION.git
cd OVH-BASTION
```

### 2.3. Step 2: Configure Terraform credentials

You need to configure your OVH credentials in two files to allow Terraform to connect to the OVH API.

1. **openrc.sh**
   This file contains environment variables required to access your OVH project. You can find an example of this file in the repository (`openrc.sh`).
   You can download this file in IAM section on OVHCloud interface or you can use the actual example I just gave if the user is the same.

   Once you have the file configured, run the command below  to load all environments variables in your current shell :
   ```bash
   source openrc.Sh
   ```
  

   Here is the full OVH documentation about this file : [OpenRC Doc][OpenRC]



2. **terraform.tfvars**
   Create a file named `terraform.tfvars` at the root of the project to store your Terraform credentials. This file is ignored by Git for security reasons (it is included in `.gitignore`).

   The contents of `terraform.tfvars` should look like this:

   ```bash
   application_key    = "xxxxxx"
   application_secret = "yyyyy"
   consumer_key       = "zzzzz"
   ```

   Replace the values `xxxxxx`, `yyyyy`, and `zzzzz` with your own OVH API keys (Available on **Passbolt**).

3. **~/.aws/credentials**

    Terraform uses S3 bucket as the backend for state storage. Ensure that you have credentials configured for this.

    First, install [awscli][awscli package] package 

    Create or update the `~/.aws/credentials` file with your AWS credentials (Available on **Passbolt**):

    ```bash
    [default]
    aws_access_key_id = YOUR_ACCESS_KEY_ID
    aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
    ```

### 2.4. Step 3: Initialize and apply Terraform

Once your credentials are set, you can initialize and apply Terraform to provision the infrastructure.

1. Initialize Terraform (and the backend S3) in the project directory:

   ```bash
   terraform init
   ```

2. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

   Confirm the changes by typing `yes` when prompted by Terraform.

</br>

You can see what terraform will create in [Ressources Section](#6-resources)


## 3. Pre-commit Hooks

This project uses [pre-commit][pre-commit] hooks to enforce code quality and consistency before every commit. The hooks are configured in the `.pre-commit-config.yaml` file, ensuring that your Terraform code and other files follow best practices.

### 3.1. Step 1: Install Pre-commit

First, install pre-commit:

```bash
pip install pre-commit
```

Or, you can use your favorite package manager.

### 3.2. Step 2: Install the Hooks

To install the pre-commit hooks, run the following command in the root of your project:

```bash
pre-commit install
```

This will set up the hooks to run automatically before each commit.

### 3.3. Configured Hooks

Here’s a breakdown of the hooks configured in actual `.pre-commit-config.yaml`:

1. **Terraform Hooks** (from `antonbabenko/pre-commit-terraform`):
   - **`terraform_checkov`**: Runs Checkov, a static analysis tool to detect security and compliance issues in your Terraform code.
   - **`terraform_fmt`**: Automatically formats your Terraform files to maintain consistent style.
   - **`terraform_docs`**: Generates and updates Terraform documentation based on inline comments.
   - **`terraform_tflint`**: Runs TFLint, a linter for Terraform to detect errors and enforce best practices.
   - **`tfupdate`**: Updates the Terraform provider and module versions in your configuration.

   ```yaml
   - repo: https://github.com/antonbabenko/pre-commit-terraform
     rev: v1.95.0
     hooks:
       - id: terraform_checkov
       - id: terraform_fmt
       - id: terraform_docs
       - id: terraform_tflint
       - id: tfupdate
   ```

2. **Standard Hooks** (from `pre-commit/pre-commit-hooks`):
   - **`end-of-file-fixer`**: Ensures that all files end with a newline character.
   - **`trailing-whitespace`**: Removes any trailing whitespace from your files.
   - **`check-added-large-files`**: Warns if large files (over 500KB) are added to the repository.

   ```yaml
   - repo: https://github.com/pre-commit/pre-commit-hooks
     rev: v4.6.0
     hooks:
       - id: end-of-file-fixer
       - id: trailing-whitespace
       - id: check-added-large-files
   ```

### 3.4. Step 3: Running Pre-commit Hooks Manually

You can manually run the hooks on all files with the following command:

```bash
pre-commit run -a
```

### 3.5. Step 4: Updating Hooks

To update the hooks to their latest versions as specified in the `.pre-commit-config.yaml`, use:

```bash
pre-commit autoupdate
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.5 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 2.1.0 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | ~> 0.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 2.1.0 |
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_compute_instance_v2.sah_bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) | resource |
| [openstack_compute_keypair_v2.ast_kp](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_keypair_v2) | resource |
| [openstack_networking_floatingip_associate_v2.eip_to_bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_associate_v2) | resource |
| [openstack_networking_floatingip_v2.bastion_eip](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_v2) | resource |
| [openstack_networking_port_v2.port_bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_secgroup_rule_v2.allow_ssh_from_checkpoint](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_v2.bastion_secgroup](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [ovh_cloud_project_gateway.sah_gateway](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_gateway) | resource |
| [ovh_cloud_project_network_private.sah_net](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private) | resource |
| [ovh_cloud_project_network_private_subnet.sah_subnet](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_key"></a> [application\_key](#input\_application\_key) | Application Key for OVH Cloud API | `string` | n/a | yes |
| <a name="input_application_secret"></a> [application\_secret](#input\_application\_secret) | Application Secret for OVH Cloud API | `string` | n/a | yes |
| <a name="input_consumer_key"></a> [consumer\_key](#input\_consumer\_key) | Consumer Key for OVH Cloud API | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->


[OpenRC]: https://help.ovhcloud.com/csm/fr-public-cloud-compute-set-openstack-environment-variables?id=kb_article_view&sysparm_article=KB0050935
[Terraform DL]: https://www.terraform.io/downloads.html
[awscli package]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[pre-commit]: https://pre-commit.com/
