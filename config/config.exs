import Config

config :ecto_trailer, table_name: "audit_log", redacted_fields: [:password]

import_config "#{Mix.env()}.exs"
