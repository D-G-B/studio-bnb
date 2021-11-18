class Studio < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ["Digital Audio workstation", "Audio interface", "Microphones", "Monitor"]
  validates :name, :address, :equipment, :rate, presence: true
  validates :name, uniqueness: true
  validates :equipment, inclusion: CATEGORIES
end
