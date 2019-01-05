# frozen_string_literal: true

require './test/test_helper'

module BetterItem
  class ConjuredTest < Test::Unit::TestCase
    def test_update
      item = Item.new('foo', 20, 10)
      Conjured.new(item).update
      assert_equal 19, item.sell_in
      assert_equal 8, item.quality
    end
  end
end
