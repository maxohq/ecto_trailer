defmodule Comment do
  use Ecto.Schema

  schema "comments" do
    field(:title, :string)
    belongs_to(:resource, Resource)
  end

  def changeset(%Comment{} = schema, attrs) do
    Ecto.Changeset.cast(schema, attrs, [:title])
  end
end
