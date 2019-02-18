defmodule ScriptrWeb.SessionController do
  use ScriptrWeb, :controller
  alias Scriptr.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    pharmacy = Accounts.get_by_username(auth_params["username"])
    case Comeonin.Bcrypt.check_pass(pharmacy, auth_params["password"]) do
      {:ok, pharmacy} ->
        conn
        |> put_session(:current_pharmacy_id, pharmacy.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: Routes.pharmacy_path(conn, :show, pharmacy))
      {:error, _} ->
        conn
        |> put_flash(:error, "There was a problem with your username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_pharmacy_id)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end