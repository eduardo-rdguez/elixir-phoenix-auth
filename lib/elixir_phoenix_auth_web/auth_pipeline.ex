defmodule ElixirPhoenixAuthWeb.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :elixir_phoenix_auth,
    module: ElixirPhoenixAuth.Guardian,
    error_handler: ElixirPhoenixAuthWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
