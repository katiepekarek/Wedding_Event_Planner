class Budget<ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  has_many :payments, dependent: :destroy

  monetize :total_due
end
