defmodule ElixirPhoenixAuthWeb.Router do
  use ElixirPhoenixAuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirPhoenixAuthWeb do
    pipe_through :api
  end
end
