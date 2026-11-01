# frozen_string_literal: true

module Prompt
  def prompt(message)
    print(message)
    gets.chomp
  end
end
