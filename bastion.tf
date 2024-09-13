########################################
# Import Public Keys
########################################
resource "openstack_compute_keypair_v2" "ast_kp" {
  name       = "AST"
  region     = local.region
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP8WwUWo5u/XA7uP0jXbDQKKdfpcjph35jsCTe3znWZeDa2AQjGEXVaBib3l920+C+fxwlXWgpJmZQvxFv4SO3fIlxLyEZ1CJT0Iwi8nd8qO8iKRxNJaIBuzDGtVTGG49OckylCoVRdQ35sGoPmL0hxAh45Ge42QkFIya/i05Jhd37++9+DzEuHmgruOrP0qnWzi9bXRUFkG4j2ivimzI8u5UjppOKs3QOBR3jGJvJOAax9r/zmj/7QqECs121C9jU3FYWhwB9M0BrjUm5n6MbPIfMOSXvDP4fiuIVmQ2lhtexNVfvlw50mxV42ADwTx32DYqi8CZw3paSJcFGk7B9jOEF9egZ6OkhRwnQNBpx3AFfccCLXGwtTCncvunxHhQQYWaEGv0LErwPebwxOz797w2RpmH8esay48Uft/2JTKZUSY4XXQwZ0ll35ejfLBMP8ogskItq0mxdWhbCYMA7Deki/GqBcWP4Scfab2xzQYFnfXoKZZAvzL2i2n9hA5M= user@DESKTOP-15D6K43"
}

########################################
# Create Bastion VM
########################################
resource "openstack_compute_instance_v2" "sah_bastion" {
  name            = "OVH-SAH-BASTION-RBX"
  image_name      = "Ubuntu 24.04"
  flavor_name     = "b3-8"
  region          = local.region
  security_groups = [openstack_networking_secgroup_v2.bastion_secgroup.name]

  network {
    port = openstack_networking_port_v2.port_bastion.id
  }

  network {
    uuid = tolist(ovh_cloud_project_network_private.sah_net.regions_attributes)[0].openstackid
  }

  key_pair  = openstack_compute_keypair_v2.ast_kp.name
  user_data = file("scripts/setup.sh")

  metadata = {
    "Name"       = "OVH-SAH-BASTION-RBX"
    "Author"     = "AST"
    "ManagedBy"  = "Terraform"
    "DeployedBy" = "Terraform"
  }

  depends_on = [ovh_cloud_project_network_private.sah_net, ovh_cloud_project_network_private_subnet.sah_subnet]
}

########################################
# Create Bastion's Security Group
########################################
resource "openstack_networking_secgroup_v2" "bastion_secgroup" {
  name        = "bastion-secgroup"
  description = "Security Group to limit ingress traffic for SSH only from Checkpoint SAH VPN"
  region      = local.region
}

#########################################
# Allow SSH from checkpoint
#########################################
resource "openstack_networking_secgroup_rule_v2" "allow_ssh_from_checkpoint" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "149.6.166.170/32" # Remplacez par le CIDR de votre réseau autorisé
  security_group_id = openstack_networking_secgroup_v2.bastion_secgroup.id
  region            = local.region
  description       = "Allow SSH only from Checkpoint public interface"
}
