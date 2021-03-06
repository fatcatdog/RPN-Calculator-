class RPNCalculator

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def value
   @stack.last
  end

  def plus
  performer_operand(:+)
  end

  def minus
    performer_operand(:-)
  end

  def divide
    performer_operand(:/)
  end

  def times
    performer_operand(:*)
  end

  def tokens(string)
   tokens = string.split
   tokens.map {|x| operation?(x) ? x.to_sym : Integer(x) }
  end

  def operation?(x)
    [:+, :-, :*, :/].include?(x.to_sym)
  end

  def evaluate(string)
   tokens = tokens(string)
   tokens.each do |token|
     case token
     when Integer
       push(token)
     else
       performer_operand(token)
     end
   end
   self.value
  end


  def performer_operand(symbol)
    raise "calculator is empty" if @stack.size < 2

    second_num = @stack.pop
    first_num = @stack.pop

    case symbol
    when :+
      @stack << first_num + second_num
    when :-
      @stack << first_num - second_num
    when :*
      @stack << first_num * second_num
    when :/
      @stack << first_num.fdiv(second_num)
    else
      @stack << first_num
      @stack << second_num
      raise "No such operation: #{symbol}"
    end
    end

    def play
      i = 0
      while i < 1
      puts "Make a guess (ex. 1 2 +)"
      input = gets.chomp
      puts evaluate(input)
      puts "Do you want to calculate something else Einstein? (Yes or No)"
      answer = gets.chomp
      if answer == "No"
        i += 1
        puts "Have a great day!!!"
      end
    end


    end
end

if __FILE__ == $PROGRAM_NAME
t = RPNCalculator.new
t.play
end

