class Comment < ActiveRecord::Base
  belongs_to :posts, foreing_key: "id"
end
