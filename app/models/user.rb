class User < ActiveRecord::Base
  has_secure_password
  has_many :restaurants, foreign_key: :creator_id
  has_many :reviews, foreign_key: :reviewer_id
  validates :email, presence: true, uniqueness: true

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
