class AddForeignKeyToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :tenant, null: true, foreign_key: true
  end
end
