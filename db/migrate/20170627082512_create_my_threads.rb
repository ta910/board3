class CreateMyThreads < ActiveRecord::Migration
  def change
    create_table :my_threads do |t|
      t.string  :title

      t.timestamps null: false
    end
  end
end
