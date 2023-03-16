# File: spec/gramma_stats_spc.rb
require 'grammar_stats'

RSpec.describe GrammarStats do
  it "returns true with input 'Lorem ipsum dolor sit amet.'" do
    stats = GrammarStats.new
    result = stats.check("Lorem ipsum dolor sit amet.")
    expect(result).to eq true
  end

  it "returns false with input 'lorem ipsum dolor sit amet'" do
    stats = GrammarStats.new
    result = stats.check("lorem ipsum dolor sit amet")
    expect(result).to eq false
  end

  it "returns false with input 'Lorem ipsum dolor sit amet'" do
    stats = GrammarStats.new
    result = stats.check("Lorem ipsum dolor sit amet")
    expect(result).to eq false
  end

  it "returns false with input 'lorem ipsum dolor sit amet.'" do
    stats = GrammarStats.new
    result = stats.check("Lorem ipsum dolor sit amet")
    expect(result).to eq false
  end

  it "returns 50% pass rate when two tests ran (pass, fail)" do
    stats = GrammarStats.new
    stats.check("Lorem ipsum dolor sit amet.")
    stats.check("lorem ipsum dolor sit amet")
    expect(stats.percentage_good).to eq 50
  end

  it "returns 77% pass rate when 100 tests ran (77 pass, 23 fail)" do
    stats = GrammarStats.new
    77.times {stats.check("Lorem ipsum dolor sit amet.")}
    23.times {stats.check("lorem ipsum dolor sit amet")}
    expect(stats.percentage_good).to eq 77
  end

  # when converting float to int, number is round down.
  # so 12.5% becomes 12%
  it "returns 12% pass rate when 100 tests ran (25 pass, 175 fail)" do
    stats = GrammarStats.new
    25.times {stats.check("Lorem ipsum dolor sit amet.")}
    175.times {stats.check("lorem ipsum dolor sit amet")}
    expect(stats.percentage_good).to eq 12
  end

  it "returns 33% pass rate when 100 tests ran (33 pass, 67 fail)" do
    stats = GrammarStats.new
    33.times {stats.check("Lorem ipsum dolor sit amet.")}
    33.times {stats.check("lorem ipsum dolor sit amet")}
    34.times {stats.check("lorem ipsum dolor sit amet.")}
    expect(stats.percentage_good).to eq 33
  end
end