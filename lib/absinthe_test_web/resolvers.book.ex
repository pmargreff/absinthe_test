defmodule Resolvers.Book do
  def index(_parent, _args, _resolution) do
    books = AbsintheTest.Repo.all(AbsintheTest.Book)
    {:ok, books}
  end
end
