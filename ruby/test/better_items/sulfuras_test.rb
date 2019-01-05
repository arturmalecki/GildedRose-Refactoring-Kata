# frozen_string_literal: true

require './test/test_helper'

module BetterItem
  class SulfurasTest < Test::Unit::TestCase
    def test_update
      item = Item.new('foo', 10, 10)
      Sulfuras.new(item).update
      assert_equal 10, item.sell_in
      assert_equal 10, item.quality
    end
  end
end
