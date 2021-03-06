# A class to convert units of measurement
# To use: Converter.new(32).f_to_c == 0
class Converter

  attr_accessor :number

  def initialize(number)
    @number = number.to_f
  end

  def celcius_to_fahrenheit
   # Multiply by 9, then divide by 5, then add 32
   # For instance, 12C == 53.6F
   (((number * 9)/5) + 32).round(4)
  end

  def fahrenheit_to_celcius
    # Deduct 32, then multiply by 5, then divide by 9
    # For instance, 23F == -5C
    (((number - 32) * 5)/9).round(4)
  end

  def quarts_to_cups
    # Four cups in a quart
    # So, 2 quarts == 8 cups
    (number * 4).round(4)
  end

  def cups_to_quarts
    (number / 4).round(4)
  end

  def inches_to_feet
    (number / 12).round(4)
  end

  def feet_to_inches
    (number * 12).round(4)
  end

  def seconds_to_milliseconds
    # 1000 milliseconds per second
    (number * 1000).round(4)
  end

  def milliseconds_to_seconds
    (number / 1000).round(4)
  end

  def feet_to_miles
    # A mile is 5280 feet
    # So, 13200 feet == 2.5 miles
    (number / 5280).round(4)
  end

  def miles_to_feet
    (number * 5280).round(4)
  end

  def feet_to_meters
    # A meter is 3.28084 feet
    # So, A mile == 1609.344 meters (when rounded to three decimals)
    (number / 3.28084).round(3)
  end

  def meters_to_feet
    (number * 3.28084).round(4)
  end

  def ounce_to_gram
    # One ounce == 28.3495 grams
    (number * 28.3495).round(4)
  end

  def gram_to_ounce
    (number / 28.3495).round(4)
  end

  def days_to_years
    # 365.25 days per year
    (number/365.25).round(4)
  end

  def years_to_days
    (number*365.25).round(4)
  end

  def pound_to_gram
  # 453.5924 g per lb
    (number*453.5924).round(4)
  end

  def gram_to_pound
    (number/453.5924).round(4)
  end

end
