defmodule DeliveryLiveWeb.RestaurantLive.Show do
  use DeliveryLiveWeb, :live_view

  alias DeliveryLive.Delivery
  alias DeliveryLive.Delivery.Item
  alias DeliveryLive.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id} = params, _, socket) do
    socket = socket
    |> assign(:restaurant, Delivery.get_restaurant!(id) |> Repo.preload(:items))

    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :show, _params) do
    socket
    |> assign(:page_title, "Show Restaurant")
  end

  defp apply_action(socket, :new_item, _params) do
    socket
    |> assign(:page_title, "Add new Item")
    |> assign(:item, %Item{})
  end

  defp apply_action(socket, :edit_item, %{"item_id" => item_id}) do
    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Delivery.get_item!(item_id))
  end

  @impl true
  def handle_event("delete_item", %{"item-id" => item_id}, socket) do
    item = Delivery.get_item!(item_id)
    {:ok, _} = Delivery.delete_item(item)

    {:noreply, assign(socket, :restaurant, Delivery.get_restaurant!(socket.assigns.restaurant.id) |> Repo.preload(:items))}
  end
end
