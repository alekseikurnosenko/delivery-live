defmodule DeliveryLive.DeliveryTest do
  use DeliveryLive.DataCase

  alias DeliveryLive.Delivery

  describe "restaurants" do
    alias DeliveryLive.Delivery.Restaurant

    import DeliveryLive.DeliveryFixtures

    @invalid_attrs %{address: nil, name: nil, price_range: nil}

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Delivery.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Delivery.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      valid_attrs = %{address: "some address", name: "some name", price_range: 42}

      assert {:ok, %Restaurant{} = restaurant} = Delivery.create_restaurant(valid_attrs)
      assert restaurant.address == "some address"
      assert restaurant.name == "some name"
      assert restaurant.price_range == 42
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Delivery.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name", price_range: 43}

      assert {:ok, %Restaurant{} = restaurant} = Delivery.update_restaurant(restaurant, update_attrs)
      assert restaurant.address == "some updated address"
      assert restaurant.name == "some updated name"
      assert restaurant.price_range == 43
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Delivery.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Delivery.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Delivery.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Delivery.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Delivery.change_restaurant(restaurant)
    end
  end

  describe "items" do
    alias DeliveryLive.Delivery.Item

    import DeliveryLive.DeliveryFixtures

    @invalid_attrs %{calories: nil, name: nil, price: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Delivery.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Delivery.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{calories: 42, name: "some name", price: 42}

      assert {:ok, %Item{} = item} = Delivery.create_item(valid_attrs)
      assert item.calories == 42
      assert item.name == "some name"
      assert item.price == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Delivery.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{calories: 43, name: "some updated name", price: 43}

      assert {:ok, %Item{} = item} = Delivery.update_item(item, update_attrs)
      assert item.calories == 43
      assert item.name == "some updated name"
      assert item.price == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Delivery.update_item(item, @invalid_attrs)
      assert item == Delivery.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Delivery.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Delivery.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Delivery.change_item(item)
    end
  end
end
