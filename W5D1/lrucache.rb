class LRUCache
    def initialize(n)
        @arr = []
        @max_size = n
    end

    def count
        @arr.length
      # returns number of elements currently in cache
    end

    def add(el)
        @arr.delete(el)
        @arr << el
        @arr.shift if count > @max_size
      # adds element to cache according to LRU principle
    end

    def show
        p @arr
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]