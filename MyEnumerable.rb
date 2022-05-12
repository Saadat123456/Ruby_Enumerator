module MyEnumerable
  def all?
    if (block_given?)
      each do |val|
        ret = yield(val)
        if (ret == false)
          return false
        end
      end
      return true     
    else
      each do |val|
        if (val === nil || val === false)
          return false
        end
      end
      return true
    end
  end

  def any?
    if (block_given?)
      each do |val|
        ret = yield(val)
        if (ret == true)
          return true
        end
      end
      return false     
    else
      each do |val|
        if (val != nil || val != false)
          return true
        end
      end
      return false
    end
  end

  def filter
    array = []
    if (block_given?)
      each do |val|
        ret = yield(val)
        if (ret == true)
          array.push(val)
        end
      end  
    end
    array
  end
end
