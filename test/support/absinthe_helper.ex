defmodule AbsintheTestWeb.AbsintheHelpers do
  @moduledoc """
  Helpers for absinthe GraphQL testing
  """
  def query_wrapper(query, variables \\ %{}) do
    %{
      "query" => query,
      "variables" => variables
    }
  end
end
