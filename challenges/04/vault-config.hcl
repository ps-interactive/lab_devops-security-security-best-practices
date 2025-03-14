pid_file = "/tmp/vault-agent.pid"

listener "tcp" {
  address     = "127.0.0.1:8100"
  tls_disable = true # Disable TLS for local testing
}

auto_auth {
  method "token" {
    mount_path = "auth/token"
    config = {
      token_file = "/vault/secrets/token"
    }
  }
}

template {
  destination = "/app/secrets/database_password"
  contents    = "{{ with secret \"secrets/data/database\" }}{{ .Data.data.password }}{{ end }}" # or secrets/database for kv v1
  perms       = 0600
}
