- [1. Requirements](#1-requirements)
- [2. Providers](#2-providers)
- [3. Modules](#3-modules)
- [4. Resources](#4-resources)
- [5. Inputs](#5-inputs)
- [6. Outputs](#6-outputs)


<!-- BEGIN_TF_DOCS -->
## 1. Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.5 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 2.1.0 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | ~> 0.49.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.4.0 |

## 2. Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 2.1.0 |
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.49.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.4.0 |

## 3. Modules

No modules.

## 4. Resources

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
| [vault_generic_secret.ovh_credentials](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## 5. Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | Hashicorp Vault Token | `string` | n/a | yes |

## 6. Outputs

No outputs.
<!-- END_TF_DOCS -->
