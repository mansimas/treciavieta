class Post < ActiveRecord::Base
	has_many :contacts
	has_many :articles
	validates :people, presence: true, numericality: { only_integer: true, greater_than: 19, less_than: 41 }
end
