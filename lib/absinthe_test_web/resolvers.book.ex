defmodule Resolvers.Book do

  def index(_parent, _args, _resolution) do
    {:ok, [
      %AbsintheTest.Book{}
    ]}
  end
end
