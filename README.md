# EctoTrailer

[![CI](https://github.com/maxohq/ecto_trailer/actions/workflows/ci.yml/badge.svg?style=flat)](https://github.com/maxohq/ecto_trailer/actions/workflows/ci.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/ecto_trailer.svg?style=flat)](https://hex.pm/packages/ecto_trailer)
[![Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg?style=flat)](https://hexdocs.pm/ecto_trailer)
[![Total Download](https://img.shields.io/hexpm/dt/ecto_trailer.svg?style=flat)](https://hex.pm/packages/ecto_trailer)
[![License](https://img.shields.io/hexpm/l/ecto_trailer.svg?style=flat)](https://github.com/maxohq/ecto_trailer/blob/main/LICENCE)


- Fork from https://github.com/valiot/ecto_trail -> https://github.com/Nebo15/ecto_trail
- renamed, so we can release an updated package on Hex.pm

EctoTrailer allows to store changeset changes into a separate `audit_log` table.

## Installation and usage

1. Add `ecto_trailer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ecto_trailer, "~> 1.0"}]
end
```


2. Add a migration that creates `audit_log` table to `priv/repo/migrations` folder:

```elixir
defmodule EctoTrailer.TestRepo.Migrations.CreateAuditLogTable do
  @moduledoc false
  use Ecto.Migration

  @table_name String.to_atom(Application.compile_env(:ecto_trailer, :table_name, "audit_log"))

  def change(table_name \\ @table_name) do
    EctoTrailChangeEnum.create_type
    create table(table_name) do
      add :actor_id, :string, null: false
      add :resource, :string, null: false
      add :resource_id, :string, null: false
      add :changeset, :map, null: false
      add(:change_type, :change)

      timestamps([type: :utc_datetime, updated_at: false])
    end
  end
end
```

4. Use `EctoTrailer` in your repo:

```elixir
defmodule MyApp.Repo do
  use Ecto.Repo, otp_app: :my_app
  use EctoTrailer
end
```

5. Configure table name which is used to store audit log (in `config.ex`):

```elixir
config :ecto_trailer, table_name: "audit_log", redacted_fields: [:password, :token]
```

6. Use logging functions instead of defaults. See `EctoTrailer` module docs.

## Docs

The docs can be found at [https://hexdocs.pm/ecto_trailer](https://hexdocs.pm/ecto_trailer).
