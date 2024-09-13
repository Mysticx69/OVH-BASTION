###################################
# Create Private Network
###################################
resource "ovh_cloud_project_network_private" "sah_net" {
  service_name = local.service_name
  name         = "SAH-PRIVATE-NETWORKS"
  vlan_id      = 100
  regions      = [local.region]
}

###################################
# Create Private Network Subnet
###################################
resource "ovh_cloud_project_network_private_subnet" "sah_subnet" {
  service_name = local.service_name
  network_id   = ovh_cloud_project_network_private.sah_net.id
  start        = "10.150.100.10"
  end          = "10.150.100.250"
  network      = "10.150.100.0/24"
  dhcp         = true
  no_gateway   = false
  region       = local.region
}

###################################
# Create Gateway Service
###################################
resource "ovh_cloud_project_gateway" "sah_gateway" {
  service_name = local.service_name
  name         = "SAH-GATEWAY"
  model        = "s"
  network_id   = tolist(ovh_cloud_project_network_private.sah_net.regions_attributes)[0].openstackid
  subnet_id    = ovh_cloud_project_network_private_subnet.sah_subnet.id
  region       = local.region
}

###################################
# Create Bastion's Network Port
###################################
resource "openstack_networking_port_v2" "port_bastion" {
  network_id = tolist(ovh_cloud_project_network_private.sah_net.regions_attributes)[0].openstackid
  name       = "bastion-port"
  region     = local.region

  fixed_ip {
    subnet_id = ovh_cloud_project_network_private_subnet.sah_subnet.id
  }
}

###################################
# Create Bastion's EIP
###################################
resource "openstack_networking_floatingip_v2" "bastion_eip" {
  pool   = "Ext-Net"
  region = local.region

  depends_on = [ovh_cloud_project_gateway.sah_gateway]
}

###################################
# Associate Bastion's EIP
###################################
resource "openstack_networking_floatingip_associate_v2" "eip_to_bastion" {
  floating_ip = openstack_networking_floatingip_v2.bastion_eip.address
  port_id     = openstack_networking_port_v2.port_bastion.id
  region      = local.region
}
