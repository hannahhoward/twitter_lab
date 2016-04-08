class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps null: false
    end

    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followee_id
  end
end
