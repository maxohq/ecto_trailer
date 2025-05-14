import Config

config :ecto_trailer, ecto_repos: [TestRepo]

config :ecto_trailer, TestRepo,
  database: "ecto_trailer_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  poolsize: 10,
  pool: Ecto.Adapters.SQL.Sandbox,
  # in ms
  ownership_timeout: 12_000_000

config :logger, level: :warning
# config :logger, level: :debug
