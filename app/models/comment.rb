class Comment < ActiveRecord::Base
  belongs_to :my_thread
end
