defmodule AccessTest.RateLimit.LimitationCounter do
  @moduledoc false

  use GenServer

  # Client API
  def request_in(pid) do
    GenServer.call(pid, :request)
  end

  # GenServer
  def start_link(state, opts) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:request, _from, %{count: count}) do
    if count < 60 do
      {:reply, :ok, %{count: count + 1}}
    else
      {:reply, :error, %{count: count + 1}}
    end
  end

  # cleanup count every minutes
  def handle_info(:schedule, _from) do
    schedule_cleanup_count()
    {:noreply, %{count: 0}}
  end

  def schedule_cleanup_count() do
    Process.send_after(self(), :schedule, :timer.minutes(1))
  end
end
