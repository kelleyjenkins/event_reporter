
class Cleaner

  def clean_first_name(first_name)
    first_name.capitalize
  end

  def clean_last_name(last_name)
    last_name.capitalize
  end

  def clean_phone(homephone)
    if homephone.length > 10
    homephone.gsub!(/[^0-9A-Za-z]/, '')
  elsif homephone.length < 10
      homephone.to_s.rjust(10, "0")
    elsif homephone.nil?
      homephone = "0000000000"
    else homephone
    end
  end

  def clean_street(street)
    street = street.split.each do |word|
      word.capitalize!
    end
      street.join(' ')
  end

  def clean_city(city)
    city = city.split.each do |word|
      word.capitalize!
    end
      city.join(' ')
  end

  def clean_state(state)
    state.upcase
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end
end
