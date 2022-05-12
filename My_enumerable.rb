# frozen_string_literal: true

module MyEnumerable
  def all?
    if block_given?
      each do |val|
        ret = yield(val)
        return false if ret == false
      end
    else
      each do |val|
        return false if val.nil? || val === false
      end
    end
    true
  end

  def any?
    if block_given?
      each do |val|
        ret = yield(val)
        return true if ret == true
      end
    else
      each do |val|
        return true if !val.nil? || val != false
      end
    end
    false
  end

  def filter
    array = []
    if block_given?
      each do |val|
        ret = yield(val)
        array.push(val) if ret == true
      end
    end
    array
  end
end
