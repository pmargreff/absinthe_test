defmodule Absinthe.Books.QueryTest do
  alias AbsintheTestWeb.AbsintheHelpers

  import AbsintheTest.Factory
  import ExProf.Macro

  use AbsintheTestWeb.ConnCase

  describe "books" do
    @query """
      query {
        books {
          id
          author {
            id
            name
          }
          description
          title
        }
      }
    """

    test "profiling with 100", %{conn: conn} do
      insert_list(100, :book_with_author)

      profile do
        post(conn, "/api", AbsintheHelpers.query_wrapper(@query))
      end
    end

    test "profiling with 1000", %{conn: conn} do
      insert_list(1000, :book_with_author)

      profile do
        post(conn, "/api", AbsintheHelpers.query_wrapper(@query))
      end
    end

    test "profiling with 10000", %{conn: conn} do
      insert_list(10000, :book_with_author)

      profile do
        post(conn, "/api", AbsintheHelpers.query_wrapper(@query))
      end
    end
  end
end
