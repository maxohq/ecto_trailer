defmodule EctoTrailer.Mixfile do
  use Mix.Project

  @version "1.0.1"

  def project do
    [
      app: :ecto_trailer,
      description: description(),
      package: package(),
      version: @version,
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      docs: [source_ref: "v#\{@version\}", main: "readme", extras: ["README.md"]]
    ]
  end

  def description do
    "This package allows to add audit log that is based on Ecto changesets and stored in a separate table."
  end

  def application do
    [extra_applications: [:logger, :ecto]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.14.0"},
      {:ecto_enum, "~> 1.0"},
      {:jason, "~> 1.4"},

      ## DEV
      {:ex_doc, "~> 0.38", only: [:dev], runtime: false},
      {:benchee, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  def aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp package do
    [
      contributors: ["Valiot, Nebo #15"],
      maintainers: ["Valiot"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/maxohq/ecto_trailer"},
      files: ~w(lib LICENSE mix.exs README.md)
    ]
  end
end
