defmodule DeliveryLiveWeb.ItemLive.Show do
  use DeliveryLiveWeb, :live_view

  alias DeliveryLive.Delivery

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id, "item_id" => item_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:restaurant_id, id)
     |> assign(:item, Delivery.get_item!(item_id))}
  end

  defp page_title(:show), do: "Show Item"
  defp page_title(:edit_item), do: "Edit Item"
end
