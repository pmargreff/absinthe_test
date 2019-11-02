defmodule AbsintheTestWeb.Router do
  use AbsintheTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/api", Absinthe.Plug, schema: AbsintheTest.Schema

  forward "/graphiql",
          Absinthe.Plug.GraphiQL,
          schema: AbsintheTest.Schema,
          interface: :simple
end
