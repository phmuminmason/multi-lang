# frozen_string_literal: true

FAHRENHEIT_MAX = 212.0
CELSIUS_MAX = 100.0

HEAT_ERROR = 'Temp cannot be greater than'

new_temp = 0.0
new_scale = ''

puts '~Ruby Temperature Converter~'.center(36)
print 'Enter a temperature: '
temp = gets.chomp.to_f

print 'Enter a scale (C/F): '
scale = gets.chomp.downcase

case scale
when 'c'
  if temp > CELSIUS_MAX
    puts format("%s %.2f", HEAT_ERROR, CELSIUS_MAX)
    exit
  else
    new_temp = ((9.0/5.0) * temp) + 32
    new_scale = 'Fahrenheit'
  end
when 'f'
  if temp > FAHRENHEIT_MAX 
    puts format("%s %.2f", HEAT_ERROR, FAHRENHEIT_MAX)
    exit
  else
    new_temp = (5.0/9.0) * (temp - 32)
    new_scale = 'Celsius'
  end
else
  puts 'Scale must be "C" or "F".'
  exit
end

puts format("The %s equivalent is: %.2f", new_scale, new_temp)
