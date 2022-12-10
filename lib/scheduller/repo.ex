defmodule Scheduller.Repo do
  use Ecto.Repo,
    otp_app: :scheduller,
    adapter: Ecto.Adapters.Postgres
end
