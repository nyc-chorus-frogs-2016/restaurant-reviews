class Restaurant < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :reviews
  validates :creator, presence: true
  validates :name, presence: true
  validates :cuisine, presence: true

  def editable_by? user
    creator == user
  end
end
