defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def findOffset do
    read_lines()
      |> Enum.map(fn line -> String.to_integer(line) end) 
      |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def findFirstDuplicate(acc \\ 0, mappy \\ %{}) do
    lines =
      read_lines()
      |> Enum.map(fn line -> String.to_integer(line) end)

    {offsets, total} = Enum.map_reduce(lines, acc, fn(line, acc) -> {line + acc, line + acc} end) 
    offset_map = 
      Enum.reduce(offsets, mappy, fn (offset, mapacc) ->  
        if Map.has_key?(mapacc, offset) do
          IO.inspect(offset)
          :timer.sleep(1000)
        end
        Map.put(mapacc, offset, 1)
      end) 
    findFirstDuplicate(total, offset_map)
  end


  def read_lines() do
    File.stream!("input.txt") |> Enum.map(fn line -> String.trim(line) end)
  end
end
