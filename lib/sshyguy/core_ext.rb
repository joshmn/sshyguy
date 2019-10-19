# frozen_string_literal: true

class NilClass
  def presence
    false
  end

  def present?
    false
  end
end

class String
  def presence
    present? ? self : false
  end

  def present?
    !empty?
  end
end

class FalseClass
  def presence
    false
  end

  def present?
    false
  end
end

class TrueClass
  def presence
    true
  end

  def present?
    true
  end
end
