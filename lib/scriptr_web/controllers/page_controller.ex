defmodule ScriptrWeb.PageController do
  use ScriptrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
