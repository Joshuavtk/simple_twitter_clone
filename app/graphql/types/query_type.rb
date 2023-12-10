# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    field :users, [UserType], null: false, description: 'Get all users'
    field :messages, [MessageType], null: false, description: 'Get all messages'
    field :tags, [TagType], null: false, description: 'Get all tags'

    def users
      User.all
    end

    def messages
      Message.all
    end

    def tags
      Tag.all
    end
    

    # field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #   argument :id, ID, required: true, description: "ID of the object."
    # end
    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end

    field :user, UserType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    def user(id:)
      User.find_by(id: id)
    end
    
    field :message, MessageType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    def message(id:)
      Message.find_by(id: id)
    end
    
    field :tag, TagType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    def tag(id:)
      Tag.find_by(id: id)
    end

    # field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #   argument :ids, [ID], required: true, description: "IDs of the objects."
    # end

    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end
  end
end
