class Stack
    def initialize
        @arr = []
    end

    def push(el)
        @arr << el
    end

    def pop
        raise "stack is empty!" if @arr.empty?
        @arr.pop
    end

    def peek
        raise "stack is empty!" if @arr.empty?
        @arr[-1]
    end
end

class Queue
    def initialize
        @arr = []
    end

    def enqueue(el)
        arr << el
    end

    def dequeue
        raise "queue is empty!" if arr.empty?
        arr.shift
    end

    def peek
        raise "queue is empty!" if arr.empty?
        arr[0]
    end

    def show
        arr.dup
    end

    private
    attr_reader :arr
end

class Map
    def initialize
        @arr = []
    end

    def set(key, value)
        @arr.each do |ele|
            if ele[0] == key
                ele[1] = value
                return
            end
        end
        @arr << [key, value]
    end

    def get(key)
        @arr.each { |ele| return ele[1] if ele[0] == key }
        nil
    end

    def delete(key)
        @arr.each { |ele| @arr.delete(ele) if ele[0] == key }
    end

    def show
        @arr.each { |ele| puts "#{ele[0]} ==> #{ele[1]}" }
    end
end