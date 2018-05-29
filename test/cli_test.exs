defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1, sort_in_desc_order: 1]

  test "help returned if parsed --help or -h" do
    assert parse_args(["--help", "Anything"]) == :help
    assert parse_args(["-h", "Anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["junior", "project", "99"]) == { "junior", "project", 99 }
  end

  test "count value is default if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "sort descending orders the current way" do
    result = sort_in_desc_order(create_fake_list(["a","c", "b"]))
    issues = for issue <- result, do: Map.get(issue, "created_at")
    assert issues == ~w{ c b a}
  end

  defp create_fake_list(values) do
    for value <- values, do: %{"created_at" => value, "other_date" => "xxx" }
  end
end
