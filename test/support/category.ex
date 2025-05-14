defmodule Category do
  use Ecto.Schema

  schema "categories" do
    field(:title, :string)
    belongs_to(:resource, Resource)
  end

  def changeset(%Category{} = schema, attrs) do
    Ecto.Changeset.cast(schema, attrs, [:title])
  end
end
