defmodule Ashley.Ideas.Idea do
  use Ash.Resource, otp_app: :ashley, domain: Ashley.Ideas, data_layer: AshPostgres.DataLayer

  postgres do
    table("ideas")
    repo(Ashley.Repo)
  end
end
