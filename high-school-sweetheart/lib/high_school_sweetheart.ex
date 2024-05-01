defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    head =
      name
      |> first_letter()
      |> String.upcase()

    "#{head}."
  end

  def initials(full_name) do
    first =
      full_name
      |> String.split(" ")
      |> List.to_tuple()
      |> elem(0)
      |> initial()

    second =
      full_name
      |> String.split(" ")
      |> List.to_tuple()
      |> elem(1)
      |> initial()

    "#{first} #{second}"
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     X  +  Y     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
    |> String.replace("X", initials(full_name1))
    |> String.replace("Y", initials(full_name2))
  end
end
