# resource "aws_security_group" "custom_sg" {
#   name        = "Custom Security Group"
#   description = "Custom Security Group"
#   vpc_id      = aws_vpc.custom_vpc.id
#   tags = {
#     Name = "Custom Security Group"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "http" {
#   security_group_id = aws_security_group.custom_sg.id

#   cidr_ipv4   = "0.0.0.0/0"
#   from_port   = 80
#   ip_protocol = "tcp"
#   to_port     = 80
# }

# resource "aws_vpc_security_group_ingress_rule" "https" {
#   security_group_id = aws_security_group.custom_sg.id

#   cidr_ipv4   = "0.0.0.0/0"
#   from_port   = 443
#   ip_protocol = "tcp"
#   to_port     = 443
# }

# resource "aws_vpc_security_group_ingress_rule" "ssh" {
#   security_group_id = aws_security_group.custom_sg.id

#   cidr_ipv4   = "49.37.153.163/32" #Change it your own IP
#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }


# ## Outbound Traffic open for all 

# resource "aws_vpc_security_group_egress_rule" "all_outbound" {
#   security_group_id = aws_security_group.custom_sg.id

#   cidr_ipv4   = "0.0.0.0/0"
#   from_port   = -1
#   ip_protocol = "all"
#   to_port     = -1
# }

## Check SG for EKS and delete

# resource "aws_security_group" "eks_cluster_sg" {
#   vpc_id = aws_vpc.eks_vpc.id

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "cluster-eks-sg"
#   }
# }

# resource "aws_security_group" "eks_node_sg" {
#   vpc_id = aws_vpc.eks_vpc.id

#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "eks-node-sg"
#   }
# }



######################################################################################

resource "aws_security_group" "cluster_sg" {
  name        = "Cluster Security Group"
  description = "Cluster Security Group"
  vpc_id      = aws_vpc.eks_vpc.id
  tags = {
    Name = "Cluster Security Group"
  }
}

## Outbound Traffic open for all 

resource "aws_vpc_security_group_egress_rule" "all_outbound_cluster" {
  security_group_id = aws_security_group.cluster_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}

######################################################################################

resource "aws_security_group" "node_sg" {
  name        = "Custom Security Group"
  description = "Custom Security Group"
  vpc_id      = aws_vpc.eks_vpc.id
  tags = {
    Name = "Node Security Group"
  }
}

## Inbound Traffic open for all 

resource "aws_vpc_security_group_ingress_rule" "all" {
  security_group_id = aws_security_group.node_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}


## Outbound Traffic open for all 

resource "aws_vpc_security_group_egress_rule" "all_outbound_node" {
  security_group_id = aws_security_group.node_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}