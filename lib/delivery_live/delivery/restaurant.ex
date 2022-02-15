defmodule DeliveryLive.Delivery.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :address, :string
    field :name, :string
    field :price_range, :integer

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :address, :price_range])
    |> validate_required([:name, :address, :price_range])
  end
end
