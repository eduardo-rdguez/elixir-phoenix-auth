defmodule ElixirPhoenixAuthWeb.Router do
  use ElixirPhoenixAuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ElixirPhoenixAuthWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create, :show]
  end
end
