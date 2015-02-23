class Vendor < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :contact_person, presence: true
  validates :contact_email, presence: true
end
