defmodule ElixirPhoenixAuth.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_auth,
    adapter: Ecto.Adapters.Postgres
end
