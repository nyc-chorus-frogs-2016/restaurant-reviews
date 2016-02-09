class Restaurant < ActiveRecord::Base
  include ParamAware
  belongs_to :creator, class_name: 'User'
  has_many :reviews
  validates :creator, presence: true
  validates :name, presence: true
  validates :cuisine, presence: true

  delegate :username, to: :creator, prefix:true

  def editable_by? user
    creator == user
  end

  def reviewable_by? user
    creator != user
  end

  def average_rating
    reviews.average(:rating)  || 0
  end

  def self.by_average_rating
     join_clause = 'left outer join reviews on reviews.restaurant_id = restaurants.id'
     joins(join_clause).group(:id).order('avg(reviews.rating) desc nulls last')
  end
end
