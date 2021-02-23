class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :end_date, :start_date, presence: true
#   validates :end_date, :start_date, uniqueness: true
#   validates :end_date_after_start_date

#   private

#   def end_date_after_start_date
#     if end_date < start_date
#       errors.add(:end_date, "must be after the start date")
#     end
#  end
end
