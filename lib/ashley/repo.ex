defmodule Ashley.Repo do
  use Ecto.Repo,
    otp_app: :ashley,
    adapter: Ecto.Adapters.Postgres
end
