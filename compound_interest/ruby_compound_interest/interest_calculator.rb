# frozen_string_literal: true

require_relative 'prompt'
require_relative 'string'

class InterestCalculator
  attr_accessor :deposit, :annual_rate, :monthly_rate, :period, :goal

  include Prompt

  DEPOSIT_MINIMUM = 1
  ANNUAL_RATE_MIN = 0.1
  PERIOD_MINIMUM  = 1
  GOAL_MINIMUM    = 0

  def initialize()
    self.deposit = 1
    self.annual_rate = 1
    self.monthly_rate = 0.01
    self.period = 1
    self.goal = 0

    prompt_for_info
  end

  def calculate_growth(limit = 100)
    balance = deposit
    months = nil
    i = 1
    output = []

    loop do
      raise("Iteration Limit exceeded") if i > limit

      break if i > period && months
      
      balance += balance * monthly_rate

      output << format("Month %3i. $%.2f", i, balance) if i < period

      months ||= i if balance >= goal

      i += 1
    end

    output << format("Goal of $%i will be met in %i months", goal, months)

    output.map! do |s|
      format_with_commas(s)
    end

    puts output.join("\n")
  end

  def prompt_for_info
    prompt_trait('initial deposit: $', :deposit, DEPOSIT_MINIMUM)
    prompt_trait('annual rate percentage: %', :annual_rate, ANNUAL_RATE_MIN)
    prompt_trait('period in months: ', :period, PERIOD_MINIMUM)
    prompt_trait('financial goal: $', :goal, GOAL_MINIMUM)
  end

  def prompt_trait(message, trait, minimum = 1)
    answer = prompt "Enter #{message}"

    loop do
      if answer.numeric? && answer.to_f >= minimum
        self.send("#{trait}=", answer.to_f) 

        break
      else
        fmt_trait = trait.to_s.sub('_', ' ').capitalize

        puts "#{fmt_trait} must be #{minimum} or more."

        answer = prompt "Enter #{message}"
      end
    end
  end

  def calculate_monthly_rate
    self.monthly_rate = (annual_rate.to_f / 12) / 100
  end

  def to_s
    "#{deposit}, #{annual_rate}, #{period}, #{goal}, #{monthly_rate}"
  end

  def format_with_commas(number)
    number.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
  end
end
