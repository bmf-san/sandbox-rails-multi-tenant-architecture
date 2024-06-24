class AddForeignKeyToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :tenant, null: true, foreign_key: true
  end
end
