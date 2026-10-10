# frozen_string_literal: true

new_temp = 0.0
new_scale = ''

puts '~Ruby Temperature Converter~'.center(36)
print 'Enter a temperature: '
temp = gets.chomp.to_f

print 'Enter a scale (C/F): '
scale = gets.chomp.downcase

case scale
when 'c'
  if temp > 100
    puts 'Temp cannot be greater than 100.'
    exit
  else
    new_temp = ((9.0/5.0) * temp) + 32
    new_scale = 'Fahrenheit'
  end
when 'f'
  if temp > 212 
    puts 'Temp cannot be greater than 212.'
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
