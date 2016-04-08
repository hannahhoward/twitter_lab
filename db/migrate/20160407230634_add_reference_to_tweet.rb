class AddReferenceToTweet < ActiveRecord::Migration
  def change
    add_reference :tweets, :user
  end
end
