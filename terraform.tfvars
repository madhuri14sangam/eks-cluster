# ───────────────────────────────────────────────
# terraform.tfvars
# Edit these values before running `terraform apply`.
# Defaults below match your original eksctl script as closely as possible.
# ───────────────────────────────────────────────

aws_region   = "us-east-2"
project_name = "raham"

# Bastion / Admin host — Ubuntu, m7i-flex.large, 30 GB EBS (as requested)
bastion_ami_id           = "ami-0e5497a77ef21b5ac" # Ubuntu 22.04 LTS - us-east-2
bastion_instance_type    = "m7i-flex.large"
bastion_root_volume_size = 30
key_pair_name            = "abcd"      # must already exist in your AWS account
ssh_allowed_cidr         = "0.0.0.0/0" # restrict to your IP in production, e.g. "203.0.113.10/32"

# Networking
vpc_cidr             = "10.0.0.0/16"
azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# EKS Cluster
cluster_name    = "raham-cluster-1"
cluster_version = "1.32"

# EKS Managed Nodegroup
nodegroup_name      = "raham-cluster-ng-1"
node_instance_types = ["m7i-flex.large"] # t3.micro is too small for EKS worker nodes
node_volume_size    = 20
node_desired_size   = 2
node_min_size       = 2
node_max_size       = 6
