- [1. Overview](#1-overview)
- [Quick start](#quick-start)
- [2. Requirements](#2-requirements)
- [3. Providers](#3-providers)
- [4. Modules](#4-modules)
- [5. Resources](#5-resources)
- [6. Inputs](#6-inputs)
- [7. Outputs](#7-outputs)


## 1. Overview

Ce projet a pour but de déployer une infra fonctionnelle ainsi qu'un bastion dans le cloud provider OVH en respectant les best practices d'un point de vue configuration et sécurité. 


## Quick start

<!-- BEGIN_TF_DOCS -->
## 2. Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.5 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 2.1.0 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | ~> 0.49.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.4.0 |

## 3. Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 2.1.0 |
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.49.0 |

## 4. Modules

No modules.

## 5. Resources

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

## 6. Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_key"></a> [application\_key](#input\_application\_key) | Application Key for OVH Cloud API | `string` | n/a | yes |
| <a name="input_application_secret"></a> [application\_secret](#input\_application\_secret) | Application Secret for OVH Cloud API | `string` | n/a | yes |
| <a name="input_consumer_key"></a> [consumer\_key](#input\_consumer\_key) | Consumer Key for OVH Cloud API | `string` | n/a | yes |

## 7. Outputs

No outputs.
<!-- END_TF_DOCS -->
