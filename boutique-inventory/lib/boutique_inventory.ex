defmodule BoutiqueInventory do
  def sort_by_price([]), do: []
  def sort_by_price(inventory), do: Enum.sort_by(inventory, & &1.price, :asc)

  def with_missing_price([]), do: []
  def with_missing_price(inventory), do: Enum.filter(inventory, &is_nil(&1.price))

  def update_names([], _old_word, _new_word), do: []

  def update_names(inventory, old_word, new_word),
    do: Enum.map(inventory, &update_name(&1, old_word, new_word))

  defp update_name(item, old_word, new_word),
    do: %{item | name: String.replace(item.name, old_word, new_word)}

  def increase_quantity(item, count) do
    new_quantity_by_size = Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)

    %{item | quantity_by_size: new_quantity_by_size}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_k, v}, a -> v + a end)
  end
end
