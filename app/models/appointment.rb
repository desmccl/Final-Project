class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :animal

  validates :scheduled_at, presence: true
end
