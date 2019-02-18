defmodule ScriptrWeb.PharmacyController do
  use ScriptrWeb, :controller

  alias Scriptr.Accounts
  alias Scriptr.Accounts.Pharmacy

  def new(conn, _params) do
    changeset = Accounts.change_pharmacy(%Pharmacy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pharmacy" => pharmacy_params}) do
    case Accounts.create_pharmacy(pharmacy_params) do
      {:ok, pharmacy} ->
        conn
        |> put_session(:current_pharmacy_id, pharmacy.id)
        |> put_flash(:info, "#{pharmacy.name} is now registered!")
        |> redirect(to: Routes.pharmacy_path(conn, :show, pharmacy))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pharmacy = Accounts.get_pharmacy!(id)
    render(conn, "show.html", pharmacy: pharmacy)
  end

  def edit(conn, %{"id" => id}) do
    pharmacy = Accounts.get_pharmacy!(id)
    changeset = Accounts.change_pharmacy(pharmacy)
    render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pharmacy" => pharmacy_params}) do
    pharmacy = Accounts.get_pharmacy!(id)

    case Accounts.update_pharmacy(pharmacy, pharmacy_params) do
      {:ok, pharmacy} ->
        conn
        |> put_flash(:info, "Pharmacy updated successfully.")
        |> redirect(to: Routes.pharmacy_path(conn, :show, pharmacy))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharmacy = Accounts.get_pharmacy!(id)
    {:ok, _pharmacy} = Accounts.delete_pharmacy(pharmacy)

    conn
    |> put_flash(:info, "Pharmacy deleted successfully.")
    |> redirect(to: Routes.pharmacy_path(conn, :index))
  end
end
