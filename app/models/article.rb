class Article < ActiveRecord::Base
    has_many :comment
    belongs_to :user
end
