defmodule NameBadge do
  # This is a pattern matching approach

  # def print(nil, name, nil), do: "#{name} - OWNER"
  # def print(nil, name, department), do: "#{name} - #{String.upcase(department)}"
  # def print(id, name, nil), do: "[#{id}] - #{name} - OWNER"
  # def print(id, name, department), do: "[#{id}] - #{name} - #{String.upcase(department)}"

  # Using a if, else approach
  def print(id, name, department) do
    ""
    |> Kernel.<>(if id != nil, do: "[#{id}] - ", else: "")
    |> Kernel.<>(if name != nil, do: "#{name} - ", else: "")
    |> Kernel.<>(if department != nil, do: "#{String.upcase(department)}", else: "OWNER")
  end
end
