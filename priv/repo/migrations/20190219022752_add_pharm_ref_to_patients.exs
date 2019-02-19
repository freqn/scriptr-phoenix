defmodule Scriptr.Repo.Migrations.AddPharmRefToPatients do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :pharmacy_id, references(:pharmacies)
    end

    create index(:patients, [:pharmacy_id])
  end
end
