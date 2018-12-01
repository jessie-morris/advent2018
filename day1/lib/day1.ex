defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def get_final_offset do
    read_lines()
    |> Enum.reduce(fn offset, acc -> offset + acc end)
  end

  def findFirstDuplicate(acc \\ 0, mappy \\ %{}) do
    {offsets, total} = 
      read_lines() 
      |> Enum.map_reduce( acc, fn line, acc -> {line + acc, line + acc} end)

    offset_map =
      Enum.reduce(offsets, mappy, fn offset, mapacc ->
        if Map.has_key?(mapacc, offset) do
          IO.inspect(offset)
          :timer.sleep(1000)
        end
        Map.put(mapacc, offset, 1)
      end)

    findFirstDuplicate(total, offset_map)
  end

  def read_lines() do
    File.stream!("input.txt") 
    |> Enum.map(fn line -> String.trim(line) end)
    |> Enum.map(fn line -> String.to_integer(line) end)
  end
end
