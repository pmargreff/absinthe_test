defmodule AbsintheTest.Book do
  use Ecto.Schema

  schema "books" do
    field :title, :string
    field :description, :string

    belongs_to :author, AbsintheTest.Author
    timestamps()
  end
end
