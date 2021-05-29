defmodule AccessTest.RateLimit do
  @moduledoc false

  alias AccessTest.RateLimit.LimitationCounter
  use GenServer

  # Client API
  def request_to(ip) do
    GenServer.call(__MODULE__, {:request, ip})
  end

  # GenServer
  def start_link(_) do
    GenServer.start_link(__MODULE__, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, Map.new()}
  end

  def handle_call({:request, ip}, _from, ip_map) do
    if(Map.has_key?(ip_map, ip)) do
      pid = Map.get(ip_map, ip)
      {:reply, LimitationCounter.request_in(pid), ip_map}
    else
      {:ok, pid} = LimitationCounter.start_link(%{count: 0}, [])
      {:reply, :ok, MapSet.put(ip_map, pid)}
    end
  end
end
