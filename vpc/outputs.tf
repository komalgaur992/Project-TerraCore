# Output the ID of the newly created VPC
output "vpc_id" {
  description = "The ID of the TerraCore VPC"
  value       = aws_vpc.terracore_vpc.id
}

# Output the ID of the Public Subnet
output "public_subnet_id" {
  description = "The ID of the Public Subnet"
  value       = aws_subnet.public_subnet.id
}

# Output the ID of the Private Subnet
output "private_subnet_id" {
  description = "The ID of the Private Subnet"
  value       = aws_subnet.private_subnet.id
}
