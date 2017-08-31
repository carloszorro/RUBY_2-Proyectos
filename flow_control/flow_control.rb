@number_a = 100
@number_b = 100

if(@number_a == @number_b)
  puts "SON IGUALES #{@number_a} , #{@number_b}"
end

@number_a = 100
@number_b = 200

#if
if(@number_a != @number_b)
  puts "NO SON IGUALES #{@number_a} , #{@number_b}"
end


#if-else
if(@number_a == @number_b)
  puts "SON IGUALES #{@number_a} , #{@number_b}"
else
  puts "NO SON IGUALES #{@number_a} , #{@number_b}"
end


#if-elsif
if(@number_a == @number_b)
  puts "SON IGUALES #{@number_a} , #{@number_b}"
elsif (@number_a < @number_b)
  puts "#{@number_a} ES MENOR QUE #{@number_b}"
else
  puts "NO SON IGUALES #{@number_a} , #{@number_b}"
end
