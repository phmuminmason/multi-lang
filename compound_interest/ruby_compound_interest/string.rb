# frozen_string_literal: true

class String
  def numeric?
    self.to_i.to_s == self || self.to_f.to_s == self
  end
end
