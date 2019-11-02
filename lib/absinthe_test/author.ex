defmodule AbsintheTest.Author do
  use Ecto.Schema

  schema "authors" do
    field :name, :string
    field :age, :integer

    has_many :books, AbsintheTest.Book
    timestamps()
  end
end
