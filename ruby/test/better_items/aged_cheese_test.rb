# frozen_string_literal: true

require './test/test_helper'

module BetterItem
  class AgedCheeseTest < Test::Unit::TestCase
    def test_update
      item = Item.new('foo', 10, 10)
      AgedCheese.new(item).update
      assert_equal 9, item.sell_in
      assert_equal 11, item.quality
    end

    def test_update_when_quality_is_50
      item = Item.new('foo', 10, 50)
      AgedCheese.new(item).update
      assert_equal 9, item.sell_in
      assert_equal 50, item.quality
    end
  end
end
