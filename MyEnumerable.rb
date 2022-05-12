class MyEnumerable
  def initialize( list ) 
    @list = list
  end
  def all?
    if (block_given?)
      @list.each do |val|
        ret = yield(val)
        if (ret == false)
          return false
        end
      end
      return true     
    else
      @list.each do |val|
        if (val === nil || val === false)
          return false
        end
      end
      return true
    end
  end
end

e = MyEnumerable.new([1, false])
puts e.all?