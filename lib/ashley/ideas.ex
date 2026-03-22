defmodule Ashley.Ideas do
  use Ash.Domain, otp_app: :ashley

  resources do
    resource Ashley.Ideas.Idea
  end
end