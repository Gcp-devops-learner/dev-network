# Copyright 2021 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.

module "vpc" {
  source                                 = "terraform-google-modules/network/google//modules/vpc"
  project_id                             = var.project_id
  network_name                           = var.network_name
  auto_create_subnetworks                = var.auto_create_subnetworks
  routing_mode                           = var.routing_mode
  description                            = var.description
  delete_default_internet_gateway_routes = var.delete_default_internet_gw
  mtu                                    = var.mtu
  shared_vpc_host                        = var.shared_vpc_host

}

module "subnet" {
  source = "terraform-google-modules/network/google//modules/subnets"

  project_id   = var.project_id
  network_name = var.network_name
  subnets = [

    for s in var.subnets : {
      subnet_name           = s.subnet_name
      subnet_ip             = s.subnet_ip
      subnet_region         = s.subnet_region
      subnet_private_access = "true"
      subnet_flow_logs      = "false"
    }
  ]
}


module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = var.network_name
  rules = [

    for r in var.rules : {
      name                    = r.name
      description             = r.description
      direction               = r.direction
      priority                = r.priority
      ranges                  = r.ranges
      source_tags             = r.source_tags
      source_service_accounts = r.source_service_accounts
      target_tags             = r.target_tags
      target_service_accounts = r.target_service_accounts
      allow                   = r.allow
      deny                    = r.deny
      log_config              = r.log_config
  }]
}
