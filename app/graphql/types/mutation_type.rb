# frozen_string_literal: true
require 'digest'

module Types
  class MutationType < Types::BaseObject

    field :create_user, UserType, null: true do
      argument :user_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def create_user(user_name:, email:, password:)
      password = Digest::MD5.hexdigest password
      User.create(user_name: user_name, email: email, password: password)
    end

    field :update_user, UserType, null: true do
      argument :id, ID, required: true
      argument :user_name, String, required: false
      argument :email, String, required: false
      argument :password, String, required: false
    end
    def update_user(id:, user_name: nil, email: nil, password: nil)
      user = User.find(id)
      if password
        password = Digest::MD5.hexdigest password 
      end
      user.update(user_name: user_name || user.user_name, email: email || user.email, password: password || user.password)
      user
    end

    field :delete_user, UserType, null: true do
      argument :id, ID, required: true
    end
    def delete_user(id:)
      user = User.find(id)
      user.destroy
      user
    end


    field :create_message, MessageType, null: true do
      argument :content, String, required: true
      argument :user_id, ID, required: true
      argument :tag_ids, [ID], required: false
    end
    def create_message(content:, user_id:, tag_ids: [])
      user = User.find(user_id)
      message = user.messages.create(content: content)

      message.tags << Tag.where(id: tag_ids) if tag_ids.present?

      message
    end

    field :update_message, MessageType, null: true do
      argument :id, ID, required: true
      argument :content, String, required: false
      argument :user_id, ID, required: false
      argument :tag_ids, [ID], required: false
    end
    def update_message(id:, content: nil, user_id: nil, tag_ids: [])
      message = Message.find(id)
      message.update(
        content: content || message.content,
        user_id: user_id || message.user_id
      )

      message.tags = Tag.where(id: tag_ids) if tag_ids.present?
    
      message
    end    
    
    field :delete_message, MessageType, null: true do
      argument :id, ID, required: true
    end
    def delete_message(id:)
      message = Message.find(id)
      message.destroy
      message
    end


    field :create_tag, TagType, null: true do
      argument :name, String, required: true
    end
    def create_tag(name:)
      Tag.create(name: name)
    end

    field :update_tag, TagType, null: true do
      argument :id, ID, required: true
      argument :name, String, required: true
    end
    def update_tag(id:, name: nil)
      tag = Tag.find(id)
      tag.update(name: name)
      tag
    end

    field :delete_tag, TagType, null: true do
      argument :id, ID, required: true
    end
    def delete_tag(id:)
      tag = Tag.find(id)
      tag.destroy
      tag
    end
  
  end
end
