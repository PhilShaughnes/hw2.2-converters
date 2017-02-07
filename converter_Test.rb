require 'minitest/autorun'
require './converter'
require 'pry'

class ConverterTest < MiniTest::Test

  def test_c_to_f
    assert Converter.new(-30).c_to_f == -22
    assert conv(0).c_to_f == 32
    assert conv(-22).c_to_f == -7.6
    assert conv(22).c_to_f == 71.6
  end

  def test_f_to_c
    asserttest(:f_to_c, [[23, -5],
                        [33, 0.5556],
                        [0, -17.7778]])
  end

  def test_quarts_to_cups
    asserttest(:quarts_to_cups, [[0, 0],
                                [1.5, 6],
                                [2.2, 8.8],
                                [5.12343, 20.4937]])
  end

  def test_cups_to_quarts
    asserttest(:cups_to_quarts, [[6, 1.5],
                                [3, 0.75],
                                [11, 2.75],
                                [20, 5]])
  end

  def test_inches_to_feet
    asserttest(:inches_to_feet, [[6, 0.5],
                                  [12, 1],
                                  [0, 0],
                                  [8, 0.6667]])
  end

  def test_feet_to_inches
    asserttest(:feet_to_inches, [[1, 12],
                                [1.5, 18],
                                [2.33, 27.96]])
  end

  def test_seconds_to_milliseconds
    asserttest(:seconds_to_milliseconds, [[8, 8000],
                                         [8.1234, 8123.4]])
  end

  def test_milliseconds_to_seconds
    asserttest(:milliseconds_to_seconds, [[123.456, 0.1235],
                                         [5, 0.005]])
  end

  def test_feet_to_miles
    asserttest(:feet_to_miles, [[8, 0.0015],
                               [5282, 1.0004],
                               [13200, 2.5]])
  end

  def test_miles_to_feet
    asserttest(:miles_to_feet, [[1, 5280],
                                [0, 0],
                                [1.5, 7920]])
  end

  def test_feet_to_meters
    asserttest(:feet_to_meters, [[5280, 1609.344],
                                [8, 2.438],
                                [2.3, 0.701]])
  end

  def test_meters_to_feet
    asserttest(:meters_to_feet, [[8, 26.2467],
                                [2, 6.5617],
                                [2.439, 8.0020]])
  end

  def test_ounce_to_gram
    asserttest(:ounce_to_gram, [[5, 141.7475],
                               [3, 85.0485],
                              [1, 28.3495]])
  end

  def test_gram_to_ounce
    asserttest(:gram_to_ounce, [[8, 0.2822],
                               [30, 1.0582],
                               [56.6, 1.9965],
                               [56.7, 2]])
  end

  def test_days_to_years
    asserttest(:days_to_years, [[5, 0.0137],
                               [365, 0.9993],
                               [1461, 4]])
  end

  def test_years_to_days
    asserttest(:years_to_days, [[4, 1461],
                               [ 1, 365.25],
                               [2.33, 851.0325],
                               [1.333, 486.8783]])
  end

  def test_pound_to_gram
    asserttest(:pound_to_gram, [[1, 453.5924],
                               [5, 2267.962],
                               [1.3, 589.6701]])
  end

  def test_gram_to_pound
    asserttest(:gram_to_pound, [[1, 0.0022],
                               [4321, 9.5262],
                               [453.5924, 1]])
  end

  def conv(num)
    @conv = Converter.new(num)
  end

#'meth' is a method to use on the object (the one you wish to test)
#'arr' is an array of array pairs - the first to input, the second the expected result.
# Each pair is plugged into the testing template.
# It will do the inspect of what the method returned if the test fails.
  def asserttest(meth, arr)
    arr.each do |n|
      assert conv(n[0]).send(meth) == n[1],
      conv(n[0]).send(meth).inspect
    end
  end

end
