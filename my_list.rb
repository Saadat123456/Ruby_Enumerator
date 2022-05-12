require_relative 'my_enumerable'

# My List Class
class MyList
  include MyEnumerable
  def initialize(*list)
    @list = []
    list.each do |l|
      @list.push(l)
    end
  end

  def each(&block)
    @list.each(&block)
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)

# Test #all?
puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })

# Test #any?
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })

# Test #filter
puts(list.filter(&:even?))
