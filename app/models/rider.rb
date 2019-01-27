class Rider < ApplicationRecord
  validates :first_name, :last_name, :city, :state, :latitude, :longitude, presence: true 
end
