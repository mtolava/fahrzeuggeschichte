class Visit < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user, optional: true
  belongs_to :owner

  has_many :inspections, dependent: :destroy
end
