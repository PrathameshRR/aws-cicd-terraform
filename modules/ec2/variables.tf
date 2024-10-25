variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "environment" {
  description = "The deployment environment"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01e3c4a339a264cc9"
}
