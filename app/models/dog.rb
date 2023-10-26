class Dog < ApplicationRecord
  has_many :dogsitters
  has_many :strolls
  belongs_to :city
end
