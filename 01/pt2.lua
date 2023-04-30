local file_path = "input.txt"

local cur_elf = 0
local a, b, c = 0, 0, 0

function EvalCurElf()
  if cur_elf > a and a < b and a < c then
    a = cur_elf
  elseif cur_elf > b and b < c then
    b = cur_elf
  elseif cur_elf > c then
    c = cur_elf
  end
end

for line in io.lines(file_path) do
  line = line:gsub("\n", "")
  if line == "" then
    EvalCurElf()
    cur_elf = 0
    goto continue
  end

  cur_elf = cur_elf + tonumber(line)

  ::continue::
end

EvalCurElf()

print(string.format("A %d + B %d + C %d = %d", a, b, c, a + b + c))
