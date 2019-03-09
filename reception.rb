class Reception
  attr_accessor :till, :drinks, :room_tabs

  def initialize(drinks, room_tabs)
    @drinks = drinks
    @room_tabs = room_tabs
  end

def add_to_room_tab(room, drink)
  price = @drinks[drink]
  @room_tabs[room] += price
end

end
