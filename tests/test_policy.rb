require 'minitest/autorun'
require 'policy'

class PolicyTest < Minitest::Test
  def test_fixture_decisions
    signal_case_1 = WatchParseMarkdownScope::Signal.new(demand: 62, capacity: 75, latency: 19, risk: 15, weight: 4)
    assert_equal 79, WatchParseMarkdownScope.score(signal_case_1)
    assert_equal 'review', WatchParseMarkdownScope.classify(signal_case_1)
    signal_case_2 = WatchParseMarkdownScope::Signal.new(demand: 95, capacity: 107, latency: 16, risk: 14, weight: 8)
    assert_equal 197, WatchParseMarkdownScope.score(signal_case_2)
    assert_equal 'accept', WatchParseMarkdownScope.classify(signal_case_2)
    signal_case_3 = WatchParseMarkdownScope::Signal.new(demand: 100, capacity: 103, latency: 14, risk: 18, weight: 9)
    assert_equal 185, WatchParseMarkdownScope.score(signal_case_3)
    assert_equal 'accept', WatchParseMarkdownScope.classify(signal_case_3)
  end
end
