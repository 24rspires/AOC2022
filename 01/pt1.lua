local file_path = "input.txt"
local file = io.open(file_path, "r")
assert(file ~= nil, "File could not be found")

local line = file:read("*l")
local answer = 0
local cur_elf = 0

while line ~= nil do
  line = line:gsub("\n", "")
  if line == "" then
    if cur_elf > answer then answer = cur_elf end
    cur_elf = 0
    goto continue
  end

  cur_elf = cur_elf + tonumber(line)

  ::continue::
  line = file:read("*l")
end


print(string.format("Answer %d", answer))
