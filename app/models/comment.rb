class Comment < ActiveRecord::Base
  belongs_to :my_thread
  belongs_to :user
  validates :title, presence: :true
end
