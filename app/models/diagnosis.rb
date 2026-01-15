class Diagnosis < ApplicationRecord
  belongs_to :visit

  validates :description, presence: true
  validates :resolution, presence: true
  validates :cost_estimate, presence: true
end
