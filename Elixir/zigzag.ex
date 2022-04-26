require Integer

defmodule Solution do
  def convert(s, num_rows) do
    list =
      s
      |> String.split("", trim: true)

    len = length(list)

    if num_rows > 1 do
      converting(list, 0, 0, num_rows, length(list), "", 2)
    else
      s
    end
  end

  def converting(_, i, _, rows, _, res, _) when i >= rows do
    res
  end

  def converting(list, i, j, rows, len, res, 5) when i < rows and i != rows - 1 do
    pos1 = if j * (2 * rows - 2) + i < 0, do: len + 1, else: j * (2 * rows - 2) + i
    pos2 = if j * (2 * rows - 2) - i < 0, do: len + 1, else: j * (2 * rows - 2) - i

    if pos1 >= len and pos2 >= len do
      converting(list, i + 1, 0, rows, len, res, 5)
    else
      converting(
        list,
        i,
        j + 1,
        rows,
        len,
        "#{res}#{Enum.at(list, pos2)}#{Enum.at(list, pos1)}",
        5
      )
    end
  end

  def converting(list, i, j, rows, len, res, 2) when i == 0 do
    pos = j * (rows * 2 - 2)

    if pos >= len do
      converting(list, i + 1, 0, rows, len, res, 5)
    else
      converting(list, i, j + 1, rows, len, res <> Enum.at(list, pos), 2)
    end
  end

  def converting(list, i, j, rows, len, res, _flag) when i == rows - 1 do
    pos = j * (2 * rows - 2) + rows - 1

    if pos >= len do
      converting(list, i + 1, 0, rows, len, res, 9)
    else
      converting(list, i, j + 1, rows, len, res <> Enum.at(list, pos), 10)
    end
  end
end

"""

i = 0
0  | 3 | 0 * (2*3 - 2) | P
4  | 3 | 1 * (2*3 - 2) | A
8  | 3 | 2 * (2*3 - 2) | H
12 | 3 | 3 * (2*3 - 2) | N

L | C  | R | j | I |
P | 0  | 4 | 0 | 0 | 0 * (2*4 -2)
I | 6  | 4 | 1 | 0 | 1 * (2*4 -2)
N | 12 | 4 | 2 | 0 | 2 * (2*4 -2)

i = 1
1  | 3 | 0  | 0 | (2 * 3 - 2) = 4  | 0 * (2*3-2) + 1 | A 3-2
3  | 3 | 3  | 1 | (2 * 3 - 2) = 4  | 1 * (2*3-2) - 1 | P 3-4
5  | 3 | 6  | 2 | (2 * 3 - 2) = 4  | 1 * (2*3-2) + 1 | L 3-6
7  | 3 | 9  | 3 | (2 * 3 - 2) = 4  | 2 * (2*3-2) - 1 | S 3-8
9  | 3 | 12 | 4 | (2 * 3 - 2) = 4  | 2 * (2*3-2) + 1 | I 3-10
11 | 3 | 15 | 5 | (2 * 3 - 2) = 4  | 2 * (2*3-2) - 1 | I 3-12
13 | 3 | 18 | 6 | (2 * 3 - 2) = 4  | 2 * (2*3-2) + 1 | G 3-15


A | 4 | 0 | 1  | (2*4-2)= 6 |  0 * (2*4-2) + 1
L | 4 | 1 | 5  | (2*4-2)= 6 |  1 * (2*4-2) - 1
S | 4 | 2 | 7  | (2*4-2)= 6 |  1 * (2*4-2) + 1
I | 4 | 3 | 11 | (2*4-2)= 6 |  2 * (2*4-2) - 1
G | 4 | 4 | 13 | (2*4-2)= 6 |  2 * (2*4-2) + 1


i = 2
2  | 3 | 0 * 3 + 2 | Y
6  | 3 | 1 * 3 + 3 | I
10 | 3 | 2* 3 + 4  | R

"""
