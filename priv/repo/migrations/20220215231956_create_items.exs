defmodule DeliveryLive.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :integer
      add :calories, :integer
      add :restaurant_id, references(:restaurants, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:restaurant_id])
  end
end
