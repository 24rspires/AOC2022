local file_path = "input.txt"
local file = io.open(file_path)
assert(file ~= nil, "File not found")
local score = 0

Line = file:read("*l")

repeat
  Line = Line:gsub("\n", "")
  if Line == "" then break end

  local enemy = Line:sub(0, 1)
  local player = Line:sub(3, 4)

  if player == "X" then
    score = score + 1
    if enemy == "A" then
      score = score + 3
    elseif enemy == "C" then
      score = score + 6
    end
  elseif player == "Y" then
    score = score + 2
    if enemy == "A" then
      score = score + 6
    elseif enemy == "B" then
      score = score + 3
    end
  elseif player == "Z" then
    score = score + 3
    if enemy == "B" then
      score = score + 6
    elseif enemy == "C" then
      score = score + 3
    end
  else
    print(string.format("Unreachable Enemy %s Player %s", enemy, player))
    return 1
  end

  Line = file:read("*l")
until (Line == nil)
file:close()


print(string.format("Answer %d", score))
