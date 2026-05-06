require 'minitest/autorun'
require 'domain_review'

class DomainReviewTest < Minitest::Test
  def test_domain_lane
    item = WatchParseMarkdownScope::DomainReview.new(signal: 79, slack: 40, drag: 31, confidence: 87)
    assert_equal 192, WatchParseMarkdownScope.domain_review_score(item)
    assert_equal "ship", WatchParseMarkdownScope.domain_review_lane(item)
  end
end
