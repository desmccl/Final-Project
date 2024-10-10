class Customer < ApplicationRecord
    has_many :appointments
  has_many :animals, through: :appointments

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
