variable "public_security_group_id" {
    description = "Public Security Group"
    type = string
}

variable "public_subnet_ids" {
    description = "Public Subnet IDs"
    type = list
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}