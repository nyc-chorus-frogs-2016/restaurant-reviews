class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reviewer, class_name: 'User'
  validates :body, presence: true
  validates :rating, numericality: {only_integer: true,
    greater_than: 0,
    less_than: 6 }

  delegate :username, to: :reviewer, allow_nil: true
  
end
