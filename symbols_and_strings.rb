def super_print(str, options = {})
  new_str = str.dup

  options = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }.merge(options)

  new_str.upcase! if options[:upcase]
  new_str.reverse! if options[:reverse]

  options[:times].times { puts new_str}
  self
end

p super_print("sam", :times => 5, :upcase => true)




