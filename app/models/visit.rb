class Visit < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user, optional: true
  belongs_to :owner

  has_many :inspections, dependent: :destroy
  has_many :diagnoses, dependent: :destroy
  has_many_attached :attachments   # ActiveStorage

  has_paper_trail if defined?(PaperTrail)

  validates :occurred_at, presence: true
  validates :reason, presence: true
  validates :km, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
