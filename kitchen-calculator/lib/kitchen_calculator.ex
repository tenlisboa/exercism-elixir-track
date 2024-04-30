defmodule KitchenCalculator do
  @milliliter 1
  @cup_milliliter 240
  @fluid_ounce_milliliter 30
  @teaspoon_milliliter 5
  @tablespoon_milliliter 15

  def get_volume({_, volume}), do: volume

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume * @milliliter}
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * @cup_milliliter}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * @fluid_ounce_milliliter}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * @teaspoon_milliliter}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * @tablespoon_milliliter}

  def from_milliliter({_, volume}, :cup), do: {:cup, volume / @cup_milliliter}

  def from_milliliter({_, volume}, :fluid_ounce),
    do: {:fluid_ounce, volume / @fluid_ounce_milliliter}

  def from_milliliter({_, volume}, :teaspoon), do: {:teaspoon, volume / @teaspoon_milliliter}

  def from_milliliter({_, volume}, :tablespoon),
    do: {:tablespoon, volume / @tablespoon_milliliter}

  def from_milliliter({_, volume}, :milliliter), do: {:milliliter, volume}

  def convert({:milliliter, _} = volume_pair, unit) do
    from_milliliter(volume_pair, unit)
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
