class Inspection < ApplicationRecord
  belongs_to :visit

  validates :type, presence: true   # ej: 'frenos', 'motor', 'eléctrico'
  validates :description, presence: true
  validates :severity, inclusion: { in: %w[low medium high critical] }, allow_blank: true
end
