defmodule Discuss2.CommentsChannel do
  use Discuss2Web, :channel

  def join(name, _params, socket) do
    {:ok, %{hey: "there"}, socket}
  end

  def handle_in(name, message, socket) do
    IO.puts("++++++++++")
    IO.puts(name)
    IO.inspect(message)
    {:reply, :ok, socket}
  end
end
