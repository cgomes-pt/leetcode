defmodule Solution do

  def my_atoi(s) do
    result = s
          |> String.trim
          |> String.split

    if Integer.parse(result) != :error do
      {num,_} = Integer.parse(result)
      cond do
        num < -2 ** 31 -> -2 ** 31
        num > 2 ** 31 - 1 -> 2 ** 31 - 1
        true  -> num
      end
    else
      0
    end
  end

  def get_numbers(s) do
    result = s
          |> String.replace(~r"[a-z /]"," ")
          |> String.split("")
          |> Enum.reject(fn x -> x == " " || x == "" end)
          |> Enum.join("")
          |> String.to_integer

    cond do
      result < -2 ** 31 -> -2 ** 31
      result > 2 ** 31 - 1 -> 2 ** 31 - 1
      true  -> result
    end
  end
end
