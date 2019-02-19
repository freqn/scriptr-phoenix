defmodule Scriptr.Accounts.Patient do
  use Ecto.Schema
  import Ecto.Changeset


  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    belongs_to :pharmacy, Scriptr.Accounts.Pharmacy
    has_many :orders, Scriptr.Accounts.Order
    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end
end
