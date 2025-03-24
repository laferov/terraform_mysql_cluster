terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "6.0.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
}


provider "selectel" {
  domain_name = var.service-account-id
  username    = var.service-account-name
  password    = var.service-account-password
  auth_region = "pool"
  auth_url    = "https://cloud.api.selcloud.ru/identity/v3/"
}

provider "openstack" {
  auth_url    = "https://cloud.api.selcloud.ru/identity/v3"
  domain_name = var.service-account-id
  tenant_id   = var.project-id
  user_name   = var.service-account-name
  password    = var.service-account-password
  region      = var.region
}


