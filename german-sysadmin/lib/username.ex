defmodule Username do
  def sanitize(username) do
    username
    |> Enum.flat_map(&german_chars/1)
    |> Enum.filter(&allowed_chars/1)
  end

  defp allowed_chars(char) do
    case char do
      c when c >= ?a and c <= ?z -> true
      c when c == ?_ -> true
      _ -> false
    end
  end

  defp german_chars(char) do
    case char do
      ?ä -> [?a, ?e]
      ?ö -> [?o, ?e]
      ?ü -> [?u, ?e]
      ?ß -> [?s, ?s]
      _ -> [char]
    end
  end
end
