# 1. Main VPC: Defines the foundational network boundary
resource "aws_vpc" "terracore_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "TerraCore-VPC"
  }
}

# 2. Public Subnet: Hosts public-facing resources like Load Balancers
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.terracore_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraCore-Public-Subnet"
  }
}

# 3. Private Subnet: Securely hosts backend resources like Databases or AI models
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.terracore_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "TerraCore-Private-Subnet"
  }
}

# 4. Internet Gateway: Provides internet access to the Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terracore_vpc.id

  tags = {
    Name = "TerraCore-IGW"
  }
}
# 5. Elastic IP: Static public IP required for the NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# 6. NAT Gateway: Allows private instances to access the internet securely
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "TerraCore-NAT"
  }
}

# 7. Public Route Table: Routes internet traffic to the Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terracore_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "TerraCore-Public-RT"
  }
}

# 8. Private Route Table: Routes outbound traffic to the NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terracore_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "TerraCore-Private-RT"
  }
}

# 9. Route Table Associations: Linking subnets to their respective route tables
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
