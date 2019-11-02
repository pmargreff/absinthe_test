defmodule AbsintheTest.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: AbsintheTest.Repo

  def author_factory do
    %AbsintheTest.Author{
      name: sequence(:title, &"Author #{&1}"),
      age: Enum.random(1..100)
    }
  end

  def book_with_author_factory do
    %AbsintheTest.Book{
      title: sequence(:title, &"Book #{&1}"),
      description: "A lot of loren ipsum",
      author: insert(:author)
    }
  end
end
