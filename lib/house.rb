class House
  attr_reader :price, :address, :rooms


  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end


  def add_room(room)
    @rooms << room
  end


  def rooms_from_category(category)
    @rooms.select {|room| category == room.category}
  end


  def area
    room_area = @rooms.collect {|room| room.area}

    room_area.sum
  end


  def price_per_square_foot
    price_per_sf = @price.to_f/area.to_f
    price_per_sf.round(2)
  end
end
