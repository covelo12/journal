
provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

variable "vault_address" {
  type    = string
  default = env("VAULT_ADDR")
}

variable "vault_token" {
  type    = string
  default = env("VAULT_TOKEN")
}

resource "vault_mount" "app_secrets" {
  path = "secret"
  type = "kv-v2"
}
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "kubernetes"
}

resource "vault_policy" "reader" {
  name   = "app-reader"
  policy = <<EOT
path "secret/data/app/*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_kubernetes_auth_backend_role" "app" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "app-role"
  bound_service_account_names      = ["app-sa"]
  bound_service_account_namespaces = ["default"]
  token_policies                   = [vault_policy.reader.name]
}
