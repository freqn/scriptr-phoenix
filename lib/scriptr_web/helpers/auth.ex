defmodule ScriptrWeb.Helpers.Auth do

  def signed_in?(conn) do
    pharmacy_id = Plug.Conn.get_session(conn, :current_pharmacy_id)
    if pharmacy_id, do: !!Scriptr.Repo.get(Scriptr.Accounts.Pharmacy, pharmacy_id)
  end

end