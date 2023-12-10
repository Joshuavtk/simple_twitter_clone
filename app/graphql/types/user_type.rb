# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :user_name, String, null: true
    field :email, String, null: true
    field :password, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :messages, [Types::MessageType]

    # include GraphQL::Types::Relay::NodeBehaviors
  
  end
end
