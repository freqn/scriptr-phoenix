defmodule Scriptr.Accounts.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset
  
  alias Comeonin.Bcrypt

  schema "pharmacies" do
    field :encrypted_password, :string
    field :name, :string
    field :username, :string
    has_many :locations, Scriptr.Accounts.Location
    has_many :patients, Scriptr.Accounts.Patient
    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name, :username, :encrypted_password])
    |> unique_constraint(:username)
    |> validate_required([:name, :username, :encrypted_password])
    |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
  end
end
