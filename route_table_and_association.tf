resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = "eks-public-route-table"
  }
}

resource "aws_route_table" "eks_private_route_table" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "eks-private-route-table"
  }
}

resource "aws_route_table_association" "a" {
  count          = 3
  subnet_id      = aws_subnet.public_eks_subnet[count.index].id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "b" {
  count          = 3
  subnet_id      = aws_subnet.private_eks_subnet[count.index].id
  route_table_id = aws_route_table.eks_private_route_table.id
}