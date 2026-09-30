# frozen_string_literal: true

PLANETS = {
  mercury: 0.38,
  venus: 0.91,
  moon: 0.165,
  mars: 0.38,
  jupiter: 2.34,
  saturn: 0.93,
  uranus: 0.92,
  neptune: 1.12,
  pluto: 0.066
}.freeze
REPORT_LINE = 'Weight on '
PROMPT_WIDTH = 26

report = []

print 'What is your name?: '.ljust(PROMPT_WIDTH)
name = gets.chomp

print 'How much do you weigh?: '.ljust(PROMPT_WIDTH)
weight = gets.chomp.to_f

PLANETS.each do |planet, factor| 
  new_weight = weight * factor
  line = REPORT_LINE + planet.to_s.capitalize
  
  report << format("%-20s %10.2f", line, new_weight)
end

puts 'Your weight on other planets'.center(30)
puts report.join("\n")
