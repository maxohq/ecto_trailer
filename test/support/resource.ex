defmodule Resource do
  @moduledoc false
  use Ecto.Schema

  schema "resources" do
    field(:name, :string)
    field(:password, :string)
    field(:array, {:array, :string})
    field(:map, :map)

    embeds_one :data, Data, primary_key: false do
      field(:key1, :string)
      field(:key2, :string)
    end

    embeds_many :items, Item, primary_key: false do
      field(:name, :string)
    end

    has_many(:comments, Comment)
    has_one(:category, {"categories", Category}, on_replace: :delete)

    timestamps()
  end

  def embed_changeset(schema, attrs) do
    Ecto.Changeset.cast(schema, attrs, [:key1, :key2])
  end

  def embeds_many_changeset(schema, attrs) do
    Ecto.Changeset.cast(schema, attrs, [:name])
  end
end
