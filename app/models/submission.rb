class Submission < ApplicationRecord
  validates :first_name, :last_name, :email, :slogan, presence: true
  validates :first_name, :last_name, :email, length: { maximum: 40 }
  validates :slogan, length: { maximum: 50 }
  validates :email, format: { with: /@/ }
end
