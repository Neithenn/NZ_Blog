class Post < ActiveRecord::Base
	has_many :comments
	acts_as_taggable
end
