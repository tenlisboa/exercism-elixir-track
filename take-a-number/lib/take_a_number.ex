defmodule TakeANumber do
  def start() do
    spawn(&(machine/0))
  end


  defp machine(state \\ 0)
  defp machine(state) do
    state = if state != 0, do: state, else: 0

    receive do
      {:report_state, sender_pid} -> 
        send(sender_pid, state)
        machine(state)
      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        machine(state + 1)
      :stop -> exit(:stop)
      _ -> machine(state)
    end
  end
end
