defmodule LanguageList do
  @type language() :: String.t()

  @spec new() :: list(language())
  def new(), do: []

  @spec add(list(language()), language()) :: list(language())
  def add(list, language), do: [language] ++ list

  @spec remove(list(language())) :: list(language())
  def remove(list), do: List.delete_at(list, 0)

  @spec first(list(language())) :: language()
  def first(list), do: List.first(list)

  @spec count(list(language())) :: number()
  def count(list), do: length(list)

  def functional_list?(list), do: Enum.member?(list, "Elixir")
end
