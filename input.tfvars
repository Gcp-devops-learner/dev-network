project_id = "formlabs-377008"

delete_default_internet_gw = "true"


network_name = "dev-network-host-vpc"


subnets = [
  {
    subnet_name               = "subnet-01"
    subnet_ip                 = "10.235.0.0/24"
    subnet_region             = "us-east1"
    subnet_private_access     = "true"
    subnet_flow_logs          = "true"
    description               = "This subnet has a description"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  },
  {
    subnet_name               = "subnet-02"
    subnet_ip                 = "10.0.1.0/24"
    subnet_region             = "us-east1"
    subnet_private_access     = "true"
    subnet_flow_logs          = "true"
    description               = "This subnet has a description"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  },
  {
    subnet_name               = "subnet-03"
    subnet_ip                 = "10.235.2.0/24"
    subnet_region             = "us-east1"
    subnet_private_access     = "true"
    subnet_flow_logs          = "true"
    description               = "This subnet has a description"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  }
]

rules = [{
  name                    = "deny-everything-to-by-default"
  description             = "Deny everything to by default"
  direction               = "EGRESS"
  priority                = 65534
  ranges                  = ["0.0.0.0/0"]
  source_tags             = null
  source_service_accounts = null
  target_tags             = []
  target_service_accounts = null
  allow                   = []
  deny = [{
    protocol = "all"
    ports    = []
  }]
  log_config = {
    metadata = "INCLUDE_ALL_METADATA"
  }
  },
  {
    name                    = "deny-everything-from-by-default"
    description             = "Deny everything from by default"
    direction               = "INGRESS"
    priority                = 65534
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = []
    target_service_accounts = null
    allow                   = []
    deny = [{
      protocol = "all"
      ports    = []
    }]
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
}, ]