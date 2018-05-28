defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1, run: 1]

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

  # test "return string help if parsed parameter :help" do
    # assert run(["-h"]) == "usage: issues <user> <project> [ count | 4 ]"
  # end
end
