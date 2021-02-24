class Studio < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORIES = [ "Digital Audio workstation", "Audio interface", "Microphones", "Monitor"]
  validates :name, :address, :equipment, :rate, presence: true
  validates :name, uniqueness: true
  validates :equipment, inclusion: CATEGORIES
end
