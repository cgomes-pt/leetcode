defmodule Solution do

  def int_to_roman(num) do

    list = num
           |> Integer.to_string
           |> String.split("",trim: true)
           |> Enum.reverse

    list
    |> Enum.with_index
    |> Enum.reduce_while([], fn {x,pos}, acc ->

      {tmp,_} = Integer.parse(x)
      cond do
        pos == 0 -> {:cont, acc ++ [first_print(tmp)]}
        pos == 1 -> {:cont, acc ++ [second_print(tmp)]}
        pos == 2 -> {:cont, acc ++ [third_print(tmp)]}
        pos == 3 -> {:cont, acc ++ [fourth_print(tmp)]}
        true -> {:halt,acc}
      end
    end)
    |> Enum.reverse
    |> Enum.join

  end

  def first_print(i) do
    res = ""
    cond do
      i < 4 -> print_roman("I",i)
      i == 4 -> res <> "IV"
      i >= 5 and i <= 8 -> res <> "V" <> print_roman("I",i-5)
      i == 9 -> res <> "IX"
    end
  end

  def second_print(i) do
    res = ""
    cond do
      i < 4 -> print_roman("X",i)
      i == 4 -> res <> "XL"
      i >= 5 and i <= 8 -> res <> "L" <> print_roman("X",i-5)
      i == 9 -> res <> "XC"
    end
  end

  def third_print(i) do
    res = ""
    cond do
      i < 4 -> print_roman("C",i)
      i == 4 -> res <> "CD"
      i >= 5 and i <= 8 -> res <> "D" <> print_roman("C",i-5)
      i == 9 -> res <> "CM"
    end
  end

  def fourth_print(i) do
    res = ""
    cond do
      i < 4 -> print_roman("M",i)
      i == 4 -> res <> "MM"
      i >= 5 and i <= 8 -> res <> "M" <> print_roman("M",i-5)
      i == 9 -> res <> "MMM"
    end
  end

  def print_roman(char, quant) do
    if quant > 0 do
      to_string(for _y <- 0..quant-1, do: char)
    else
      ""
    end
  end

end
