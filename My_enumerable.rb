module MyEnumerable
  def all?
    if block_given?
      each do |val|
        ret = yield(val)
        if ret == false
          return false
        end
      end     
    else
      each do |val|
        if (val === nil || val === false)
          return false
        end
      end
    end
    true
  end

  def any?
    if block_given?
      each do |val|
        ret = yield(val)
        if ret == true
          return true
        end
      end     
    else
      each do |val|
        if (val != nil || val != false)
          return true
        end
      end
    end
    false
  end

  def filter
    array = []
    if block_given?
      each do |val|
        ret = yield(val)
        if ret == true
          array.push(val)
        end
      end  
    end
    array
  end
end
