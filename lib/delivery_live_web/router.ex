defmodule DeliveryLiveWeb.Router do
  use DeliveryLiveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DeliveryLiveWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DeliveryLiveWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/restaurant", RestaurantLive

    live "/admin/restaurants", RestaurantLive.Index, :index
    live "/admin/restaurants/new", RestaurantLive.Index, :new
    live "/admin/restaurants/:id/edit", RestaurantLive.Index, :edit

    live "/admin/restaurants/:id", RestaurantLive.Show, :show
    live "/admin/restaurants/:id/show/edit", RestaurantLive.Show, :edit
    live "/admin/restaurants/:id/items/new", RestaurantLive.Show, :new_item
    live "/admin/restaurants/:id/items/:item_id/edit", RestaurantLive.Show, :edit_item

    live "/admin/restaurants/:id/items/:item_id", ItemLive.Show, :show
    live "/admin/restaurants/:id/items/:item_id/show/edit", ItemLive.Show, :edit_item
  end

  # Other scopes may use custom stacks.
  # scope "/api", DeliveryLiveWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DeliveryLiveWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
