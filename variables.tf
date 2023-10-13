variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

variable "baklava" {
  type = object({
   public_path = string
   content_version = number
})
}

variable "daffodils" {
  type = object({
   public_path = string
   content_version = number
})
}

variable "kunafah" {
  type = object({
    public_path = string
    content_version = number
  })
}
