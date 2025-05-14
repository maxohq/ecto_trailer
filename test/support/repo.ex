defmodule TestRepo do
  use Ecto.Repo,
    otp_app: :ecto_trailer,
    adapter: Ecto.Adapters.Postgres

  use EctoTrailer
end
