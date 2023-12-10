class CreateMessagesTagsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :messages, :tags do |t|
    end
  end
end
