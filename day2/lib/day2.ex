defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def get_checksum do
    char_maps = 
      read_lines
      |> Enum.map(&line_to_char_map/1)


    two_occurs = Enum.filter(char_maps, fn char_map -> has_count?(char_map, 2) end) 
    three_occurs = Enum.filter(char_maps, fn char_map -> has_count?(char_map, 3) end) 

    IO.inspect(Enum.count(two_occurs) * Enum.count(three_occurs))
  end

  def read_lines() do
    File.stream!("input.txt") 
    |> Enum.map(fn line -> String.trim(line) end)
  end

  def line_to_char_map(line) do
    String.graphemes(line)
    |> Enum.reduce(%{}, fn char, acc -> 
        Map.update(acc, char, 1, fn val -> val + 1 end) end)    
  end

  def has_count?(char_map, count) do
    Enum.any?(char_map, fn {k,v} -> v == count end)
  end

  def part2  do

    diffs = 
      read_lines
      |> get_string_pairs
      |> Enum.map(fn {a, b} -> String.myers_difference(a,b) end)

    best_matches = Enum.filter(diff_array, fn dif -> Enum.count(List.flatten(dif)) == 4 end)

    #At this point I grab the best match from the output because im a cheater
   
  end

  def get_string_pairs(list) do
    for a <- list, b <- tl(list) do {a, b} end
  end

end
