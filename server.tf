resource "openstack_compute_instance_v2" "server1_master" {
  name              = "server1_master"
  flavor_id         = "1002"
  availability_zone = var.availability_zone
  user_data = "${local.common_user_data}\n${local.node_user_data}\n${local.percona_master_user_data}"

  network {
    port = openstack_networking_port_v2.port_server1_master.id
  }

  block_device {
    uuid                  = var.image_id
    volume_size           = var.volume_size
    source_type           = "image"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = [ openstack_networking_network_v2.network_1 ]
}


resource "openstack_compute_instance_v2" "server2" {
  name              = "server2"
  flavor_id         = "1002"
  availability_zone = var.availability_zone
  user_data = "${local.common_user_data}\n${local.node_user_data}"

  network {
    port = openstack_networking_port_v2.port_server2.id
  }

  block_device {
    uuid                  = var.image_id
    volume_size           = var.volume_size
    source_type           = "image"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = [ openstack_networking_network_v2.network_1 ]
}

resource "openstack_compute_instance_v2" "server3" {
  name              = "server3"
  flavor_id         = "1002"
  availability_zone = var.availability_zone
  user_data = "${local.common_user_data}\n${local.node_user_data}"

  network {
    port = openstack_networking_port_v2.port_server3.id
  }

  block_device {
    uuid                  = var.image_id
    volume_size           = var.volume_size
    source_type           = "image"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = [ openstack_networking_network_v2.network_1 ]
}

resource "openstack_compute_instance_v2" "server-bastion" {
  name              = "server-bastion"
  flavor_id         = "1002"
  availability_zone = var.availability_zone
  user_data = "${local.common_user_data}\n${local.bastion_user_data}"

  network {
    port = openstack_networking_port_v2.port-server-bastion.id
  }

  block_device {
    uuid                  = var.image_id
    volume_size           = var.volume_size
    source_type           = "image"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = [ openstack_networking_network_v2.network_1 ]
}

resource "openstack_networking_floatingip_associate_v2" "association_bastion" {
  port_id     = openstack_networking_port_v2.port-server-bastion.id
  floating_ip = var.floating_ip_address
}
