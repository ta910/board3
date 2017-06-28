class AddUserIdToMyThreads < ActiveRecord::Migration
  def change
    add_reference :my_threads, :user, index: true, foreign_key: true
  end
end
