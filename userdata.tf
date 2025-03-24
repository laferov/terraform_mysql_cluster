# resource "selectel_vpc_keypair_v2" "keypair_1" {
#   name    = "keypair"
#   public_key = file("~/.ssh/id_rsa.pub")
#   user_id = var.service-account-id
# }

# Общий скрипт
locals {
  common_user_data = file("data/base.sh")
}

# Уникальные скрипты для каждого инстанса
locals {
  bastion_user_data = templatefile("data/bastion.sh", {
    instance_name = "bastion"
  })
  
  percona_master_user_data = templatefile("data/percona_master.sh", {
    instance_name = "percona_master"
  })
  node_user_data = templatefile("data/node.sh", {
    instance_name = "node"
  })
}