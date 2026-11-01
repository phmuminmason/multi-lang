# frozen_string_literal: true

class Compound_interest
  attr_accessor :text

  def initialize()
    self.text = "Hello, world!"
  end
end

compound_interest = Compound_interest.new
puts compound_interest.text
