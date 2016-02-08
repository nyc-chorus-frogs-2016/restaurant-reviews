class Restaurant < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :reviews
  validates :creator, presence: true
end
