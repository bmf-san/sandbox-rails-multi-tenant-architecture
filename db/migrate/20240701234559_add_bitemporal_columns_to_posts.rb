class AddBitemporalColumnsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :bitemporal_id, :integer
    add_column :posts, :valid_from, :datetime
    add_column :posts, :valid_to, :datetime
    add_column :posts, :transaction_from, :datetime
    add_column :posts, :transaction_to, :datetime
  end
end
