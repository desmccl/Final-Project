class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  belongs_to :customer
  belongs_to :animal
end
