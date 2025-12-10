class Owner < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  validates :name, presence: true
  validates :document, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
