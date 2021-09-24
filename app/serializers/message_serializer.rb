class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :room_id
end
