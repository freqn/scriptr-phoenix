defmodule Scriptr.Accounts.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :name, :string
    field :latitude, :string
    field :longitude, :string
    belongs_to :pharmacy, Scriptr.Accounts.Pharmacy
    has_many :orders, Scriptr.Accounts.Order
    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :latitude, :longitude])
    |> validate_required([:name, :latitude, :longitude])
  end
end
