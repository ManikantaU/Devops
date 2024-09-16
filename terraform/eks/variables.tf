variable "cluster_name" {
    type = string
    default = "eks-test-cluster"

}
variable "cluster_role_name" {
    type = string
    default = "eks-cluster-role"
}
variable "cluster_enabled_log_types" {
   type = list(string)
   default = ["api", "audit"]
}

variable "bootstrap_self_managed_addons" {
     type        = bool
     default     = null
}
variable "cluster_additional_security_group_ids" {
  type = list(string)
  default = [ "sg-0c70222391822fad9", "sg-0745506f82ad18a32" ]
}
variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to launch the cluster in"
  default = [ "subnet-0281da00619fb30a7", "subnet-046b9d2a0b9ca139f", "subnet-06fe79449d8068272" ]
}
variable "cluster_endpoint_public_access_cidrs" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
  default     = false
}
variable "service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
  type        = string
  default     = null
}
variable "service_ipv6_cidr" {
  description = "The CIDR block to assign Kubernetes pod and service IP addresses from if `ipv6` was specified when the cluster was created. Kubernetes assigns service addresses from the unique local address range (fc00::/7) because you can't specify a custom IPv6 CIDR block when you create the cluster"
  type        = string
  default     = null
}
variable "ip_family" {
  description = "The IP family used to assign Kubernetes pod and service addresses. Valid values are `ipv4` (default) and `ipv6`. You can only specify an IP family when you create a cluster, changing this value will force a new cluster to be created"
  type        = string
  default     = "ipv4"
}
variable "outpost_config" {
  description = "Configuration for the AWS Outpost to provision the cluster on"
  type        = any
  default     = {}
}