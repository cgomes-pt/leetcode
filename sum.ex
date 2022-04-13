defmodule TwoSum do
  # Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target



  def sum(nums, target) do
    nums
    |> Enum.with_index
    |> Enum.reduce_while([], fn {x, i},acc ->
      find = target - x
	  tmp = Enum.find(acc, fn x -> x == find end)
      if tmp != nil,
        do: {
          :halt,
          [Enum.find_index(acc,fn x -> x == find end),i ]
        },
        else: {
          :cont,
          acc ++ [x]
        }
    end)
  end



end
