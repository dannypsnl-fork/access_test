defmodule AccessTest.Repo do
  use Ecto.Repo,
    otp_app: :access_test,
    adapter: Ecto.Adapters.Postgres
end
