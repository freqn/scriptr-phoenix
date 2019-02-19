defmodule :"Elixir.Scriptr.Repo.Migrations.Add-name-to-location" do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :name, :string
    end
  end
end
