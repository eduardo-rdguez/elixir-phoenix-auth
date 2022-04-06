defmodule ElixirPhoenixAuthWeb.Router do
  use ElixirPhoenixAuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ElixirPhoenixAuthWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
  end
end
