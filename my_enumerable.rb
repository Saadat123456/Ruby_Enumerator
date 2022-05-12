# My enumerable
module MyEnumerable
  def all?
    each do |val|
      return (val.nil? || val == false) unless block_given?

      ret = yield(val)
      return false if ret == false
    end
    true
  end

  def any?
    each do |val|
      return (val.nil? || val == false) unless block_given?

      ret = yield(val)
      return true if ret == true
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
