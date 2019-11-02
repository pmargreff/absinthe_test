defmodule AbsintheTestWeb.Router do
  use AbsintheTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AbsintheTestWeb do
    pipe_through :api
  end
end
