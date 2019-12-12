# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :discuss2,
  ecto_repos: [Discuss2.Repo]

# Configures the endpoint
config :discuss2, Discuss2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cHAjgdShEbQ1iypfzbdll13hCAcL2+1srGmtCFsF6Jyzv9p7mIMVwFGW4+MqSYAi",
  render_errors: [view: Discuss2Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss2.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "1cd916ffff9eea7ed6e3",
  client_secret: "7e12e5b8d407d126b1e4c91c53905af1a1c5f6e1"
