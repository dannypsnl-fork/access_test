defmodule AccessTest.RateLimit.LimitationCounterTest do
  use ExUnit.Case

  alias AccessTest.RateLimit.LimitationCounter

  @moduletag :capture_log

  doctest LimitationCounter

  test "module exists" do
    assert is_list(LimitationCounter.module_info())
  end

  test "rate limit" do
    {:ok, pid} = LimitationCounter.start_link(%{count: 0}, [])
    assert :ok == LimitationCounter.request_in(pid)
  end

  test "over rate limit" do
    {:ok, pid} = LimitationCounter.start_link(%{count: 60}, [])
    assert :error == LimitationCounter.request_in(pid)
  end
end
