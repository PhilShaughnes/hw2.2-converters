require './converter'
require 'tty'

prompt = TTY::Prompt.new

def getnum #is this or a while loop better? It gets a number from the user.
  print "Please input your number: "
  num = $stdin.gets.chomp
  num.to_i.to_s != num ? getnum : num
end

#all the options for conversion available in the Converter class are in this Hash.
convlist = {celcius: "celcius_to_fahrenheit",
            fahrenheit: "fahrenheit_to_celcius",
            quarts: "quarts_to_cups",
            cups: "cups_to_quarts",
            inches: "inches_to_feet",
            feet: {inches: "feet_to_inches", miles: "feet_to_miles", meters: "feet_to_meters"},
            milliseconds: "milliseconds_to_seconds",
            seconds: "seconds_to_milliseconds",
            miles: "miles_to_feet",
            meters: "meters_to_feet",
            ounces: "ounce_to_gram",
            grams: {pounds: "gram_to_pound", ounces: "gram_to_ounce"}
            }

# cool display header thingy
puts "****************************************"
puts "***** The Amazing Unit Converter! ******"
puts "****************************************"

while prompt.yes?('Would you like to convert a number?')
  print "Great! "
  num = getnum

  meth = prompt.select("Convert from:", convlist)
  meth = prompt.select("Convert to:", meth) if meth.is_a?(Hash)
  #you could make this a while(meth.is_a?(Hash)) loop if you had lots of nested hashes.

  result = Converter.new(num).send(meth)

  puts "#{num} was converted to #{result} using #{meth}"
end
