defmodule Scriptr.Accounts.Prescription do
  use Ecto.Schema
  import Ecto.Changeset


  schema "prescriptions" do
    field :name, :string
    belongs_to :order, Scriptr.Accounts.Order
    timestamps()
  end

  @doc false
  def changeset(prescription, attrs) do
    prescription
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
