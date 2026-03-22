defmodule Ashley.Kanban.Board do
  use Ash.Resource,
    otp_app: :ashley,
    domain: Ashley.Kanban,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "boards"
    repo Ashley.Repo
  end

  attributes do
    uuid_primary_key :id
    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    belongs_to :idea, Ashley.Ideas.Idea do
      allow_nil? false
      public? true
    end
  end

  actions do
    defaults [:read, :update, :destroy]

    create :create do
      argument :idea_id, :uuid, allow_nil?: false
      accept [:idea_id]
      change manage_relationship(:idea_id, :idea, type: :append)
    end
  end

  code_interface do
    define :create
  end
end
