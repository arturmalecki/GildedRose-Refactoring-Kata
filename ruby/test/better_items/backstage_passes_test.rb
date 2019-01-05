# frozen_string_literal: true

require './test/test_helper'

module BetterItem
  class BackstagePassesTest < Test::Unit::TestCase
    def test_update
      item = Item.new('foo', 20, 10)
      BackstagePasses.new(item).update
      assert_equal(19, item.sell_in)
      assert_equal(11, item.quality)
    end

    def test_update_first_term
      item = Item.new('foo', 10, 10)
      BackstagePasses.new(item).update
      assert_equal(9, item.sell_in)
      assert_equal(12, item.quality)
    end

    def test_update_second_term
      item = Item.new('foo', 5, 10)
      BackstagePasses.new(item).update
      assert_equal(4, item.sell_in)
      assert_equal(13, item.quality)
    end

    def test_update_after_term
      item = Item.new('foo', 0, 10)
      BackstagePasses.new(item).update
      assert_equal(-1, item.sell_in)
      assert_equal(0, item.quality)
    end
  end
end
