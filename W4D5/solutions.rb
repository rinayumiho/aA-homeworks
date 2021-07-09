def longest_fish(arr)
    # O(n^2)
    arr.each do |ele|
        longest = true
        arr.each do |ele2|
            if ele2 > ele
                longest = false
                break
            end
        end
        return ele if longest
    end
    nil
    
    # O(nlgn)
    arr.sort_by! { |a, b| a.length <=> b.length }
    arr[-1]

    # O(n)
    arr.inject { |acc, ele| acc.length < ele.length ? ele : acc }
end

def slow_dance(str, arr)
    (0...arr.length).each { |i| return i if str == arr[i] }
    nil
end

def constant_dance(str, hash)
    hash.key?(str) ? hash[str] : nil
end