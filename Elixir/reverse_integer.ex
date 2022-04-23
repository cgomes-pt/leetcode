defmodule Solution do
  def reverse(x) do
    list = x
    |> Integer.to_string
    |> String.split("",trim: true)
    |> Enum.reverse

    inverse_int(list,[],0)

  end


  def inverse_int([],res,0) do
    if res > 2 ** 31 - 1 do
      0
    else
      res
    end
  end

  def inverse_int([],res,1) do
    if -res < -2 ** 31  do
      0
    else
      -res
    end
  end

  def inverse_int([t], res, signal) do
    {final,_} = Integer.parse(List.to_string(res ++ [t]))
    if t == "-" do
      inverse_int([],final,1)
    else
      inverse_int([],final,0)
    end
  end

  def inverse_int([h|t], res,signal) do
    IO.puts(h)
    inverse_int(t,res ++ [h],signal)

  end
end
