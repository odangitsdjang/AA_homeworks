class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack.dup
  end
end


class Queue
  def initialize
    # create ivar to store queue here!
    @queue = []
  end

  def add(el)
    # adds an element to the queue
    @queue.unshift(el)
  end

  def remove
    # removes one element from the queue
    @queue.shift(el)
  end

  def show
    # return a copy of the queue
    @queue.dup
  end
end

class Map
  def initialize
    @map = {}
  end

  def assign(key, value)
    @map[key] = value
  end

  def lookup(key)
    @map[key]
  end

  def remove(key)
    @map.reject { |k, _| k == key }
  end

  def show
    self.deep_dup
  end

  def deep_dup
    new_map = Map.new
    @map.each { |k, _| new_map[k] = @map[k].dup }
    new_map
  end
end

if __FILE__ == $PROGRAM_NAME
  testmap = Map.new
  testmap2 = testmap.deep_dup
  p testmap.object_id
  p testmap2.object_id
end
