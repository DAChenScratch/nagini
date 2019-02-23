defmodule Nagini.MixProject do
  use Mix.Project

  def project do
    [
      app: :nagini,
      version: "0.2.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Nagini.Application, []},
      extra_applications: [:logger, :runtime_tools, :appsignal]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.1"},
      {:phoenix_pubsub, "~> 1.1"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:logger_file_backend, "~> 0.0.10"},
      {:appsignal, "~> 1.0"},

      # Workaround locks:
      #
      # Appsignal 1.0 requires Poison. Poison 4 requires Elixir 1.6. Nanobox
      # does not support Elixir 1.6 yet, so we lock Poison to 3.
      #
      {:poison, "~> 3.1"}
    ]
  end
end
