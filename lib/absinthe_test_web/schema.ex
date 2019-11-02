defmodule AbsintheTest.Schema do
  use Absinthe.Schema
  use Absinthe.Schema.Notation

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
    field :author, :author
  end

 query do
   @desc "Get all books"
    field :books, list_of(:book) do
      resolve &Resolvers.Book.index/3
    end
 end
end
