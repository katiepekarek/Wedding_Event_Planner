class Vendor < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :contact_person, presence: true
  validates :contact_email, presence: true

  has_many :budgets, dependent: :destroy
  has_many :users, through: :budgets
  has_many :events

end
