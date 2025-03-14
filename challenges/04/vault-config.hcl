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
  destination = "/app/secrets/db_user"
  contents    = "{{ with secret \"secret/database\" }}{{ .Data.data.username }}{{ end }}"
  perms       = 0600
}

template {
  destination = "/app/secrets/db_pass"
  contents    = "{{ with secret \"secret/database\" }}{{ .Data.data.password }}{{ end }}"
  perms       = 0600
}
