defmodule DeliveryLive.DeliveryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DeliveryLive.Delivery` context.
  """

  @doc """
  Generate a restaurant.
  """
  def restaurant_fixture(attrs \\ %{}) do
    {:ok, restaurant} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name",
        price_range: 42
      })
      |> DeliveryLive.Delivery.create_restaurant()

    restaurant
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        calories: 42,
        name: "some name",
        price: 42
      })
      |> DeliveryLive.Delivery.create_item()

    item
  end
end
