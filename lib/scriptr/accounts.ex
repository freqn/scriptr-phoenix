defmodule Scriptr.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Scriptr.Repo

  alias Scriptr.Accounts.Pharmacy

  @doc """
  Returns the list of pharmacies.

  ## Examples

      iex> list_pharmacies()
      [%Pharmacy{}, ...]

  """
  def list_pharmacies do
    Repo.all(Pharmacy)
  end

  @doc """
  Gets a single pharmacy.

  Raises `Ecto.NoResultsError` if the Pharmacy does not exist.

  ## Examples

      iex> get_pharmacy!(123)
      %Pharmacy{}

      iex> get_pharmacy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy!(id) do
    Pharmacy
    |> Repo.get!(id)
    |> Repo.preload(:locations)
  end

  @doc """
  Creates a pharmacy.

  ## Examples

      iex> create_pharmacy(%{field: value})
      {:ok, %Pharmacy{}}

      iex> create_pharmacy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy(attrs \\ %{}) do
    %Pharmacy{}
    |> Pharmacy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy.

  ## Examples

      iex> update_pharmacy(pharmacy, %{field: new_value})
      {:ok, %Pharmacy{}}

      iex> update_pharmacy(pharmacy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy(%Pharmacy{} = pharmacy, attrs) do
    pharmacy
    |> Pharmacy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pharmacy.

  ## Examples

      iex> delete_pharmacy(pharmacy)
      {:ok, %Pharmacy{}}

      iex> delete_pharmacy(pharmacy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy(%Pharmacy{} = pharmacy) do
    Repo.delete(pharmacy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy changes.

  ## Examples

      iex> change_pharmacy(pharmacy)
      %Ecto.Changeset{source: %Pharmacy{}}

  """
  def change_pharmacy(%Pharmacy{} = pharmacy) do
    Pharmacy.changeset(pharmacy, %{})
  end

  def get_by_username(username) when is_nil(username) do
    nil
  end

  def get_by_username(username) do
    Repo.get_by(Pharmacy, username: username)
  end

  alias Scriptr.Accounts.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(%Pharmacy{} = pharmacy, attrs \\ %{}) do
    pharmacy
    |> Ecto.build_assoc(:locations)
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Pharmacy{} = pharmacy, %Location{} = location) do
    location
    |> Location.changeset(%{})
    |> put_pharmacy(pharmacy)
  end

  defp put_pharmacy(changeset, pharmacy) do
     Ecto.Changeset.put_assoc(changeset, :pharmacy, pharmacy)
  end
end
