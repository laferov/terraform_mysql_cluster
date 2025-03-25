resource "openstack_lb_loadbalancer_v2" "lb_1" {
 vip_subnet_id = openstack_networking_subnet_v2.subnet_1.id
}


resource "openstack_lb_listener_v2" "listener_1" {
  protocol        = "TCP"
  protocol_port   = 3306
  loadbalancer_id = openstack_lb_loadbalancer_v2.lb_1.id
  
}

resource "openstack_networking_floatingip_associate_v2" "association_loadbalancer" {
  port_id     = openstack_lb_loadbalancer_v2.lb_1.vip_port_id
  floating_ip = "37.9.4.57"
}

resource "openstack_lb_pool_v2" "pool_1" {
  protocol    = "TCP"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_1.id

}

resource "openstack_lb_members_v2" "members_1" {
  pool_id = openstack_lb_pool_v2.pool_1.id

  member {
    address       = "192.168.168.101"
    protocol_port = 3306
  }

  member {
    address       = "192.168.168.102"
    protocol_port = 3306
  }
  member {
    address       = "192.168.168.103"
    protocol_port = 3306
  }
}

