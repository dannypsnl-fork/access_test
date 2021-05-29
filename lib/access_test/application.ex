defmodule AccessTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AccessTest.Repo,
      # Start the Telemetry supervisor
      AccessTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AccessTest.PubSub},
      # Start the Endpoint (http/https)
      AccessTestWeb.Endpoint,
      # Start a worker by calling: AccessTest.Worker.start_link(arg)
      # {AccessTest.Worker, arg}
      {AccessTest.CoronaVote, name: AccessTest.CoronaVote}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AccessTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AccessTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
