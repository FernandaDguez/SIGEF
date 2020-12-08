class Instructor < ApplicationRecord
  belongs_to :efac, inverse_of: :instructors
  has_one_attached :resume

  validates :name, presence: true
  validates :experience, presence: true
  validates :resume, presence: true
end
