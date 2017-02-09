if __FILE__ == $0
  looping = true
  while looping
    input = gets.chomp
    if input.downcase == "quit" then looping = false end
  end
end
