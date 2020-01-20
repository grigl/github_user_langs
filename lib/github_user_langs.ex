defmodule GithubUserLangs do
  @moduledoc """
  Documentation for GithubUserLangs.
  """

  @doc """
  GithubUserLangs.
  Retrives github user known languages by his account name
  """

  @api_url "https://api.github.com/users/"

  def get(username) do
    @api_url <> username
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("repos_url")
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
    |> Enum.map(fn x -> x["language"] end)
    |> Enum.uniq
    |> Enum.filter(fn x -> !is_nil(x) end)
  end
end
