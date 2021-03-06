class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms
    end

    def create
        rooms = Room.new(room_params)
        if rooms.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            RoomSerializer.new(rooms)
            ).serializable_hash
            ActionCable.server.broadcast 'rooms_channel', serialized_data
            head :ok
        end
    end
      
    private
    
    def room_params
        params.require(:room).permit(:title)
    end

end
