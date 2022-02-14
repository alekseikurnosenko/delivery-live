defmodule DeliveryLive.Repo do
  use Ecto.Repo,
    otp_app: :delivery_live,
    adapter: Ecto.Adapters.Postgres
end
