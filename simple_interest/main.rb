# frozen_string_literal: true

print 'Enter principal: $'
principal = gets.chomp.to_i

print 'Enter rate: %'
rate = gets.chomp.to_f / 100

print 'Enter time (years): '
time = gets.chomp.to_i

interest = principal * rate * time

puts format('Interest $%.2f', interest)
