# frozen_string_literal: true

A_PLUS_SCORE = 97.0
PASSING_SCORE = 60.0
NUMBER_OF_SCORES = 4

class StudentGrade
  attr_reader :name, :scores, :average, :grade
  private attr_writer :name, :scores, :average, :grade

  def initialize
    self.name = ""
    self.scores = Array.new(NUMBER_OF_SCORES)
    self.average = 0.0
    self.grade = ""
  end

  def prompt_for_name
    print "Enter your name: "
    self.name = gets.chomp
  end

  def prompt_for_scores
    puts "Enter test scores"

    NUMBER_OF_SCORES.times do |i|
      print "Test no. #{i + 1}: "

      score = Integer(gets.chomp)

      raise ArgumentError "Score must be positive!" unless score.positive?

      self.scores[i] = score
    end
  end

  def drop?
    print 'Drop lowest score? (Y/N) '

    gets.chomp.downcase == 'y'
  end

  def analyze
    calculate_average
    self.grade = calculate_grade
  end

  def calculate_average
    self.average =  if drop?
                      scores.sort[1..].sum.fdiv(NUMBER_OF_SCORES - 1)
                    else
                      scores.sum.fdiv(NUMBER_OF_SCORES)
                    end
  end

  def calculate_grade
    return "A+" if average >= A_PLUS_SCORE
    return "F" if average < PASSING_SCORE

    letter =  case average
              when 90..100 then "A"
              when 80...90 then "B"
              when 70...80 then "C"
              when 60...70 then "D"
              end

    sign = case average.floor % 10
           when 0..3 then "-"
           when 4..6 then ""
           when 7..9 then "+"
           end

    "#{letter}#{sign}"
  end

  def to_s
    format("%s's average: %.1f%% (%s)", name, average, grade)
  end
end

student = StudentGrade.new

student.prompt_for_name
student.prompt_for_scores
student.analyze

puts student
