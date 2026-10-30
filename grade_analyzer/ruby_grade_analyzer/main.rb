# frozen_string_literal: true

require_relative 'student'

student = StudentGrade.new

student.prompt_for_name
student.prompt_for_scores
student.evaluate

puts student
