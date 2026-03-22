defmodule Ashley.Kanban.Card do
  use Ash.Resource,
    otp_app: :ashley,
    domain: Ashley.Kanban,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "cards"
    repo Ashley.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      public? true
    end

    attribute :status, :atom do
      constraints one_of: [:todo, :in_progress, :done]
      default :todo
      public? true
    end

    attribute :order, :integer do
      public? true
    end

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    belongs_to :board, Ashley.Kanban.Board do
      allow_nil? false
      public? true
    end
  end

  actions do
    defaults [:read, :update, :destroy]

    create :create do
      argument :board_id, :uuid, allow_nil?: false
      accept [:title, :description, :status, :order, :board_id]
      change manage_relationship(:board_id, :board, type: :append)
    end
  end

  code_interface do
    define :create
  end
end
