defmodule AccessTest.CoronaVote do
  @moduledoc false

  use GenServer

  # API
  def get_votes(pid) do
    GenServer.call(pid, :get_votes)
  end

  def vote_yes(pid) do
    GenServer.cast(pid, :vote_yes)
  end

  def vote_no(pid) do
    GenServer.cast(pid, :vote_no)
  end

  # GenServer
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(_opts) do
    {:ok, %{yes: 0, no: 0}}
  end

  def handle_call(:get_votes, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:vote_yes, %{yes: yes, no: no}) do
    {:noreply, %{yes: yes + 1, no: no}}
  end

  def handle_cast(:vote_no, %{yes: yes, no: no}) do
    {:noreply, %{yes: yes, no: no + 1}}
  end
end
