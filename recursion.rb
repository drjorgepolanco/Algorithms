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