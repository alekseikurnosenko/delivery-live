defmodule DeliveryLive.Delivery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :calories, :integer
    field :name, :string
    field :price, :integer
    belongs_to :restaurant, DeliveryLive.Delivery.Restaurant

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :calories, :restaurant_id])
    |> validate_required([:name, :price, :calories, :restaurant_id])
  end
end
