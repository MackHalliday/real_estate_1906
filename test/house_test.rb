require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test

  def setup

    @house = House.new("$400000", "123 sugar lane")

    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)

    @room_1_room_2 = [@room_1, @room_2]
    @all_rooms = [@room_1, @room_2, @room_3, @room_4]
  end


  def test_it_exist

    assert_instance_of House, @house
  end


  def test_house_attributes

    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end


  def test_add_room_adds_rooms_to_rooms_arry

    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal @room_1_room_2, @house.rooms
  end


  def test_add_more_rooms_and_return_room_array
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal @all_rooms, @house.rooms
  end


  def test_rooms_from_category_method
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal @room_1_room_2, @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end


  def test_find_total_area_of_house_method
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end


  def test_price_per_square_foot_method
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

end
