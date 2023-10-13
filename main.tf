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
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}


module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}

resource "terratowns_home" "home" {
  name = "How to make Kunafa/Knafeh!"
  description = <<DESCRIPTION
Kunafa or Knafeh is a traditional Middle Eastern dessert, 
made with spun pastry called kataifi,
soaked in a sweet, sugar-based syrup called attar, 
and typically layered with cheese, 
or with other ingredients such as clotted cream, 
pistachio or nuts, depending on the region.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}
