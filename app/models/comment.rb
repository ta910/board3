class Comment < ActiveRecord::Base
  belongs_to :my_thread
  validates :title, presence: :true
end
