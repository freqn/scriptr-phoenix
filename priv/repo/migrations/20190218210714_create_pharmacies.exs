defmodule Scriptr.Repo.Migrations.CreatePharmacies do
  use Ecto.Migration

  def change do
    create table(:pharmacies) do
      add :name, :string
      add :username, :string
      add :encrypted_password, :string

      timestamps()
    end

    create unique_index(:pharmacies, [:username])
  end
end
