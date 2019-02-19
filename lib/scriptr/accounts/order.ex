defmodule Scriptr.Accounts.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :prescription_id, :integer
    belongs_to :patient, Scriptr.Accounts.Patient
    belongs_to :location, Scriptr.Accounts.Location
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:prescription_id, :location_id])
    |> validate_required([:prescription_id, :location_id])
  end

  def form_changeset(struct, params \\ %{}) do
    {struct, @types}
    
  end
end
