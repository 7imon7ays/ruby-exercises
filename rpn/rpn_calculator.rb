#!/usr/bin/env ruby


class RPNCalculator
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(n)
    @stack << n
  end

  def plus
    check_stack
    first = @stack.pop
    second = @stack.pop
    sum =  first + second
    @stack << sum
  end

  def minus
    check_stack
    first = @stack.pop
    second = @stack.pop
    @stack << second - first
  end

  def times
    check_stack
    @stack << @stack.pop * @stack.pop
  end

  def divide
    check_stack
    first = @stack.pop
    second = @stack.pop
    @stack << second / first.to_f
  end

  def value
    @stack.last
  end

  def check_stack
    raise "calculator is empty" if @stack.empty?
    raise "only one value in calculator" if @stack.count == 1
  end

  def tokens(str)
    str.split(" ").map do |element|
      element = ["*", "+", "-", "/"].include?(element) ? element.to_sym : element.to_i
    end
  end

  def evaluate(str)
    tokenized_str = tokens(str)
    tokenized_str.each do |expression|
      if [:*, :+, :-, :/].include?(expression)
        implement_operator(expression)
      else
        @stack << expression
      end
    end
    value
  end

  def implement_operator(token)
    case token
    when :+
      plus
    when :-
      minus
    when :*
      times
    when :/
      divide
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  puts "Welcome to your virtual RPN Calculator. Type quit to exit, clear to clear stack"
  calculator = RPNCalculator.new
  stack = calculator.stack

  loop do
    input = gets.chomp
    output = calculator.evaluate(input)
    puts output unless input == "quit"
    p stack
    break if input == 'quit'
    calculator = RPNCalculator.new if input == "clear"

  end

end
