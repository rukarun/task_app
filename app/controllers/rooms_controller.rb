class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to root_url, notice: 'Add room'
    else
      render :new
    end
  end

  private
  def room_params
    params.fetch(:room, {}).permit(:room_name, :room_introduction, :price, :address, :room_image)
  end
end
