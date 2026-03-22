defmodule AshleyWeb.PageController do
  use AshleyWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
