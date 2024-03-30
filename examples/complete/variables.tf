variable "name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "sudo-key"
}
variable "region" {
  type        = string
  description = "Region to test"
  default     = "us-east-1"
}
