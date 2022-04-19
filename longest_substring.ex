defmodule Solution do

  def length_of_longest_substring(s) do
    if String.length(s) <= 0 do
      0
    else
      list = String.split(s,"",trim: true)
      count_substring(list, 0, [], 0, 0, length(list))
    end
  end

def count_substring([], _,_,count,top, length) do
  max(count,top)
end

def count_substring([h|t], i, visited, count, top, length) do
  if i + top >= length do
    top
  else
    if Enum.find(visited, fn x -> x == h end) do
      count_substring([h|t], i + 1, List.delete(visited,Enum.at(visited,0)), count - 1, max(count,top))
    else
      count_substring(t, i, visited ++ [h], count + 1, top)
    end
  end
 end

# Another version, but time limite exceeds
#   def count_substring(_,_,_,_,_,_, top, 1) do
#     top
#   end
#
#   def count_substring(l, [], 0, 0, len, 0, 1, 0) do
#     atual = Enum.at(l,0)
#     count_substring(l, [atual], 0, 1, len, 1, 1, 0)
#   end
#
#   def count_substring(l, visited,i, i, len, count, top, _flag) do
#     count_substring(l, visited,i,i + 1,len, count + 1, max(count,top), 0)
#   end
#
#   def count_substring(l,visited, i, j, len, count, top, _flag) do
#     atual = Enum.at(l,i)
#     final = Enum.at(l,j)
#
#     if j >= len || i + top >= len do
#       count_substring(l,visited,i,j,len,count,max(count,top),1)
#     else
#         if Enum.find(visited, fn x -> x == final end) != nil || atual == final do
#             count_substring(l, List.delete(visited,atual) , i + 1, j , len, count - 1, max(count,top), 0)
#         else
#           count_substring(l, visited ++ [final], i, j + 1, len, count + 1, top, 0)
#       end
#     end
#   end
# end
