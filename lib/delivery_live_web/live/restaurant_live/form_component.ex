defmodule DeliveryLiveWeb.RestaurantLive.FormComponent do
  use DeliveryLiveWeb, :live_component

  alias DeliveryLive.Delivery

  @impl true
  def update(%{restaurant: restaurant} = assigns, socket) do
    changeset = Delivery.change_restaurant(restaurant)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"restaurant" => restaurant_params}, socket) do
    changeset =
      socket.assigns.restaurant
      |> Delivery.change_restaurant(restaurant_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"restaurant" => restaurant_params}, socket) do
    save_restaurant(socket, socket.assigns.action, restaurant_params)
  end

  defp save_restaurant(socket, :edit, restaurant_params) do
    case Delivery.update_restaurant(socket.assigns.restaurant, restaurant_params) do
      {:ok, _restaurant} ->
        {:noreply,
         socket
         |> put_flash(:info, "Restaurant updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_restaurant(socket, :new, restaurant_params) do
    case Delivery.create_restaurant(restaurant_params) do
      {:ok, _restaurant} ->
        {:noreply,
         socket
         |> put_flash(:info, "Restaurant created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
