class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :visits, dependent: :nullify

  enum role: { mechanic: 0, receptionist: 1, admin: 2 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
