class Dogsitter < ApplicationRecord
  has_many :dogs
  has_many :strolls
  belongs_to :city
end
