class Animal < ApplicationRecord
    has_many :appointments
  has_many :customers, through: :appointments

  validates :name, :species, presence: true
  #validates :age, numericality: { only_integer: true }
end
