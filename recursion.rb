# Create the fizzbuzz method that counts up to a certain number while replacing 
# multiples of 3 with fizz and multiples of 5 with buzz.

def fizzbuzz(n)
  if n == 100
    false
  else
    if n % 3 == 0 && n % 5 == 0
      puts "FizzBuzz"
    elsif n % 3 == 0
      puts "Fizz"
    elsif n % 5 == 0
      puts "Buzz"
    else
      puts n
    end
    fizzbuzz(n += 1)
  end
end

fizzbuzz(1)


# Create the exponent method. It should take 2 inputs: a and b. It should return a 
# to the power of b (ab). For example exp(2, 3) should return 8 (which is 2*2*2).

def exp(a, b)
  if b == 0
    1
  else
    a * exp(a, b - 1)
  end
end

puts exp(2, 3)