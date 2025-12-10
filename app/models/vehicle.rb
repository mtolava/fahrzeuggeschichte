class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :visits, dependent: :restrict_with_error
  has_paper_trail only: %i[km current_state] if defined?(PaperTrail)

  validates :plate, presence: true, uniqueness: true
  validates :brand, :model, :version, :year, presence: true
end
