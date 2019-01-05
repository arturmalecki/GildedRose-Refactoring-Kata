# frozen_string_literal: true

require './test/test_helper'

class GildedRoseTest < Test::Unit::TestCase
  def test_sellin_and_quality_decrease
    items = [Item.new('foo', 10, 10)]
    GildedRose.new(items).update_quality
    assert_equal(9, items[0].sell_in)
    assert_equal(9, items[0].quality)
  end

  def test_quality_decreas_twice_as_fast_when_sale_by_date_has_been_passed
    items = [Item.new('foo', 0, 10)]
    GildedRose.new(items).update_quality
    assert_equal(8, items[0].quality)
    GildedRose.new(items).update_quality
    assert_equal(6, items[0].quality)
  end

  def test_quality_can_not_be_negative
    items = [Item.new('foo', 1, 1)]
    GildedRose.new(items).update_quality
    assert_equal(0, items[0].quality)
    GildedRose.new(items).update_quality
    assert_equal(0, items[0].quality)
  end

  def test_aged_cheese_increase_quality_the_older_it_gets
    items = [Item.new('Aged Brie', 10, 10)]
    GildedRose.new(items).update_quality
    assert_equal(11, items[0].quality)
    assert_equal(9, items[0].sell_in)
  end

  def test_quality_of_na_item_is_never_more_then_50
    items = [Item.new('Aged Brie', 10, 49)]
    GildedRose.new(items).update_quality
    assert_equal(50, items[0].quality)
    assert_equal(9, items[0].sell_in)
    GildedRose.new(items).update_quality
    assert_equal(50, items[0].quality)
    assert_equal(8, items[0].sell_in)
  end

  def test_sulfuras_never_change_quality_and_sell_in
    items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
    GildedRose.new(items).update_quality
    assert_equal(10, items[0].quality)
    assert_equal(10, items[0].sell_in)
  end

  def test_backstage_passes_increase_quality_by_2_when_they_are_10_days_or_less
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
    GildedRose.new(items).update_quality
    assert_equal(12, items[0].quality)
    assert_equal(9, items[0].sell_in)
  end

  def test_backstage_passes_increase_quality_by_3_when_they_are_5_days_or_less
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
    GildedRose.new(items).update_quality
    assert_equal(13, items[0].quality)
    assert_equal(4, items[0].sell_in)
  end

  def test_backstage_passes_drops_quality_to_0_after_concert
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
    GildedRose.new(items).update_quality
    assert_equal(0, items[0].quality)
    assert_equal(-1, items[0].sell_in)
  end

  def test_conjured_items_degrade_in_quality_twice_as_fast_as_normal
    items = [Item.new('Conjured item', 10, 10)]
    GildedRose.new(items).update_quality
    assert_equal(8, items[0].quality)
    assert_equal(9, items[0].sell_in)
  end
end
