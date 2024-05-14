defmodule LogParser do
  def valid_line?(line) do
    result = Regex.run(~r/^\[\w+?\]/, line)

    case result do
      ["[DEBUG]"] -> true
      ["[INFO]"] -> true
      ["[WARNING]"] -> true
      ["[ERROR]"] -> true
      _ -> false
    end
  end

  def split_line(line), do: String.split(line, ~r/<((\*|\~|\-|\=)+)?>/)

  def remove_artifacts(line), do: String.replace(line, ~r/(end-of-line\d+)/i, "")

  def tag_with_user_name(line) do
    unless not String.match?(line, ~r/User\s+([^\s]+)/) do
      username =
        Regex.run(~r/User\s+([^\s]+)/, line)
        |> Enum.at(1)

      "[USER] #{username} " <> line
    else
      line
    end
  end
end
