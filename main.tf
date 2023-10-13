terraform {
    required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "WGS"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  
  #cloud {
  #  organization = "WGS"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
}

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}


# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.user_uuid
#   bucket_name = var.bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   assets_path = var.assets_path
#   content_version = var.content_version
# }

resource "terratowns_home" "home" {
  name = "How to make Kunafa/Knafeh!!!"
  description = <<DESCRIPTION
Kunafa or Knafeh is a traditional Middle Eastern dessert, 
made with spun pastry called kataifi,
soaked in a sweet, sugar-based syrup called attar, 
and typically layered with cheese, 
or with other ingredients such as clotted cream, 
pistachio or nuts, depending on the region.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "4wx3yz2ab1cd.cloudfront.net"
  town = "cooker-cove"
  content_version = 1
}
