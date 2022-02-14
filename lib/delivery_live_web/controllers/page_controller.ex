defmodule DeliveryLiveWeb.PageController do
  use DeliveryLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
