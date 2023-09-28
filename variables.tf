variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}
variable "bucket_name" {
  description = "The name of the AWS S3 bucket."
  type        = string

  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && 
      can(regex("^([a-z0-9][a-z0-9-.]*[a-z0-9])$", var.bucket_name))
    )
    error_message = "Invalid bucket name. The bucket name must be between 3 and 63 characters. It must contain only letters, numbers, hyphens, or periods."
  }
}