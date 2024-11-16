defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    [current_path | rest_path] = String.split(path, ".")
    has_more_nested_paths = !Enum.empty?(rest_path)

    case data[current_path] do
      nil -> nil
      val when has_more_nested_paths -> extract_from_path(val, Enum.join(rest_path, "."))
      val -> val
    end
  end

  def get_in_path(data, path), do: Kernel.get_in(data, String.split(path, "."))
end
