defmodule Project4 do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec
    :ets.new(:register, [:set, :public, :named_table])
    :ets.new(:login, [:set, :public, :named_table])
    :ets.new(:tweet, [:bag, :public, :named_table])
    :ets.new(:retweet, [:bag, :public, :named_table])
    :ets.new(:follow, [:bag, :public, :named_table])
    :ets.new(:tag, [:bag, :public, :named_table])
    :ets.new(:mention, [:bag, :public, :named_table])
    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(Project4.Endpoint, []),
      # Start your own worker by calling: Project4.Worker.start_link(arg1, arg2, arg3)
      # worker(Project4.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Project4.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Project4.Endpoint.config_change(changed, removed)
    :ok
  end
end
