# company
variable "company" {
  type        = string
  description = "This variable defines the name of the company"
  default     = "christos"
}

# environment
variable "environment" {
  type        = string
  default     = "demo"
  description = "This variable defines the environment to be built"
}