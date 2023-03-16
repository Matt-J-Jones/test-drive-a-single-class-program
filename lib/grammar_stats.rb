# File: lib/grammar_stats.rb

class GrammarStats
  def initialize
    @count = 0
    @passes = 0
  end

  def check(text) 
    # increases count of texts checked
    @count += 1

    # sets default to false, and if text meets condition
    # returns true.
    to_check = text[0].upcase
    capital_used = false; 
    capital_used = true if text[0] == to_check[0]

    # sets default to false, and if text meets condition
    # returns true.
    punct = ".?!"; punct_used = false; 
    punct_used = true if punct.include?(text[text.length-1])

    # if both tests return true, the method returns true
    if capital_used == true && punct_used == true
      # increases count of passed tests
      @passes += 1
      return true
    else
      return false
    end
  end

  def percentage_good
    # calculates percentage of the overall tests that have 
    # passed, needs to convert into float to work out percentage
    # before being returned as in int.
    
    percentage = ((@passes * 1.0) / (@count * 1.0)) * 100
    return percentage.to_i
  end
end