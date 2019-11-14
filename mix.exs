defmodule Pseudo.MixProject do
  use Mix.Project

  def project do
    [
      app: :pseudo,
      version: "0.2.2",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Pseudo",
      description: "Obfuscate text for GDPR compliance.",
      source_url: "https://github.com/mrdougwright/pseudo",
      docs: [
        main: "Pseudo",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mrdougwright/pseudo"},
      maintainers: ["Doug Wright", "et al"],
      files: ["lib", "mix.exs", "README*"]
    ]
  end
end
