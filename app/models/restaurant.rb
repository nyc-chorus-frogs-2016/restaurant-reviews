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
end
