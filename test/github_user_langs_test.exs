defmodule GithubUserLangsTest do
  use ExUnit.Case
  doctest GithubUserLangs

  test "greets the world" do
    assert GithubUserLangs.get("grigl") == ["JavaScript", "Ruby"]
  end
end
