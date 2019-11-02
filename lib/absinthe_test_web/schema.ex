defmodule AbsintheTest.Schema do
  use Absinthe.Schema
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  @desc "An author"
  object :author do
    field :id, :id
    field :name, :string
    field :age, :integer
  end

  @desc "A book"
  object :book do
    field :id, :id
    field :title, :string
    field :description, :string
    field :author, :author, resolve: dataloader(AbsintheTest.Loader)
  end

  query do
    @desc "Get all books"
    field :books, list_of(:book) do
      resolve(&Resolvers.Book.index/3)
    end
  end

  def context(ctx), do: Map.put(ctx, :loader, loader(ctx))

  def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]

  defp loader(_ctx) do
    Enum.reduce(
      [AbsintheTest.Loader],
      Dataloader.new(),
      &Dataloader.add_source(&2, &1, :erlang.apply(&1, :data, [%{}]))
    )
  end
end

defmodule AbsintheTest.Loader do
  def data(_params), do: Dataloader.Ecto.new(AbsintheTest.Repo, query: &query/2)

  def query(query, _), do: query
end
