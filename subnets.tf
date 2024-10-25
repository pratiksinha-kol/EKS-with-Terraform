resource "aws_subnet" "public_eks_subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, count.index)
  availability_zone       = element(["ap-south-2a", "ap-south-2b", "ap-south-2c"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_eks_subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, count.index + 3)
  availability_zone       = element(["ap-south-2a", "ap-south-2b", "ap-south-2c"], count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "eks-private-subnet-${count.index}"
  }
}