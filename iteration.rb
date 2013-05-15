def loop_through_nums
  i = 250
  loop do
    i += 1
    return i if i % 7 ==0
  end
end

def find_factors(number)
  factors = []
  for i in (1..number)
    if number % i == 0
      factors << i
    end
  end
  factors
end

def each_number_factors
  all_factors = []
  for i in (1..100)
    all_factors << find_factors(i)
  end
  all_factors
end


def bubble_sort(array)
  sorted_array = array.dup
  until is_sorted?(sorted_array)
    for i in (0..sorted_array.count - 2)
      if sorted_array[i] > sorted_array[i + 1]
        sorted_array[i], sorted_array[i + 1] = sorted_array[i + 1], sorted_array[i]
      end
    end
  end
  sorted_array
end


def is_sorted?(array)
  array.each_index do |index|
    next if index == 0
    return false if array[index] < array[index - 1]
  end
  true
end

array = (1..10).to_a.shuffle
p bubble_sort(array)

def substrings(str)
  substrings = []

  0.upto(str.length - 1) do |start_index|
    (start_index).upto(str.length - 1) do |end_index|
      substrings << str[start_index..end_index] unless substrings.include?(str[start_index..end_index])
    end
  end
  substrings
end

def subwords(str)
  dictionary_words = Hash.new(false)
  File.readlines('2of12inf.txt').each do |line|
    dictionary_words[line] = true
  end

  substrings(str).select do |substring|
    dictionary_words[substring + "\r\n"]
  end
end

p subwords('fiopjqfoijEF;FPIQpaoiwfjhpqwoeifjwqepofitomatoes')






