class Studio < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :address, :equipment, :rate, presence: true
  validates :name, uniqueness: true
  validates :equipment, inclusion: [ "Digital Audio workstation", "Audio interface", "Microphones", "Monitor" ]
end
