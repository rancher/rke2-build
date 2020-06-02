output "public_ip" {
  value = var.domain_name
}

output "rke2_version" {
  value = local.rke2_version
}

output "rke2_cluster_secret" {
  value = local.rke2_cluster_secret
}

output "rke2_server_ips" {
  value = join(",", aws_eip.rke2-server-eip.*.public_ip)
}

output "kubeconfig" {
  value = "export KUBECONFIG=$PWD/rke-build-${var.name}/kubeconfig.yaml"
}
