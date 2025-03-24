resource "openstack_networking_port_v2" "port_server1_master" {
  name       = "port-server1_master"
  network_id = openstack_networking_network_v2.network_1.id

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.168.101"
  }
}

resource "openstack_networking_port_v2" "port_server2" {
  name       = "port-server2"
  network_id = openstack_networking_network_v2.network_1.id

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.168.102"
  }
}

resource "openstack_networking_port_v2" "port_server3" {
  name       = "port-server3"
  network_id = openstack_networking_network_v2.network_1.id

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.168.103"
  }
}

resource "openstack_networking_port_v2" "port-server-bastion" {
  name       = "port-server-bastion"
  network_id = openstack_networking_network_v2.network_1.id

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.168.100"
  }
}