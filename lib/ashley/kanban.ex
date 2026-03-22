defmodule Ashley.Kanban do
  use Ash.Domain, otp_app: :ashley

  resources do
    resource Ashley.Kanban.Board
    resource Ashley.Kanban.Card
  end
end
