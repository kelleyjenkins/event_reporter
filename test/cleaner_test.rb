require 'minitest/autorun'
require 'minitest/pride'
require './lib/cleaner'

class CleanerTest < Minitest::Test

  def test_it_cleans_first_names
    clean = Cleaner.new

    result = clean.clean_first_name("joseph")

    assert_equal "Joseph", result
  end

  def test_it_cleans_last_names
    clean = Cleaner.new

    result = clean.clean_last_name("smith")
    assert_equal "Smith", result
  end

  def test_it_cleans_phone_number
    clean = Cleaner.new

    result = clean.clean_phone("802*863*8374")

    assert_equal "8028638374", result
  end

  def test_it_capitalizes_street_names
    clean= Cleaner.new

    result = clean.clean_street("brewer parkway")

    assert_equal "Brewer Parkway", result
  end

  def test_it_capitalizes_multi_word_city
    clean = Cleaner.new

    result = clean.clean_city("ann arbor")

    assert_equal "Ann Arbor", result
  end

  def test_it_capitalizes_state_abbreviation
    clean = Cleaner.new

    result = clean.clean_state("vt")

    assert_equal "VT", result
  end

  def test_it_cleans_zipcodes
    clean = Cleaner.new

    result = clean.clean_zipcode(456)

    assert_equal "00456", result
  end
end
