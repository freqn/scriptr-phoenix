defmodule ScriptrWeb.LocationController do
  use ScriptrWeb, :controller

  alias Scriptr.Accounts
  alias Scriptr.Accounts.Location

  plug :check_auth when action in [:index, :new, :create, :show, :edit, :update, :delete]

  def check_auth(conn, _args) do
    if pharmacy_id = get_session(conn, :current_pharmacy_id) do
    current_pharmacy = Accounts.get_pharmacy!(pharmacy_id)

    conn
      |> assign(:current_pharmacy, current_pharmacy)
    else
      conn
      |> put_flash(:error, "You need to be signed in to access that page.")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def index(conn, _params) do
    locations = Accounts.list_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Accounts.change_location(conn.assigns.current_pharmacy, %Location{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    case Accounts.create_location(conn.assigns.current_pharmacy, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Accounts.get_location!(id)
    render(conn, "show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Accounts.get_location!(id)
    changeset = Accounts.change_location(conn.assigns.current_pharmacy, location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Accounts.get_location!(id)

    case Accounts.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "#{location.name}location updated successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Accounts.get_location!(id)
    {:ok, _location} = Accounts.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: Routes.location_path(conn, :index))
  end
end
