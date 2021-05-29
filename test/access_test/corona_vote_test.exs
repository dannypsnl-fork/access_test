defmodule AccessTest.CoronaVoteTest do
  use ExUnit.Case

  alias AccessTest.CoronaVote

  @moduletag :capture_log

  doctest CoronaVote

  test "module exists" do
    assert is_list(CoronaVote.module_info())
  end

  test "vote yes" do
    {:ok, pid} = CoronaVote.start_link([])
    CoronaVote.vote_yes(pid)
    assert %{yes: 1, no: 0} == CoronaVote.get_votes(pid)
  end

  test "vote no" do
    {:ok, pid} = CoronaVote.start_link([])
    CoronaVote.vote_no(pid)
    CoronaVote.vote_no(pid)
    assert %{yes: 0, no: 2} == CoronaVote.get_votes(pid)
  end
end
