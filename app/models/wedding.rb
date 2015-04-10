class Wedding<ActiveRecord::Base
  has_many :events
  has_many :vendors, through: :events
  belongs_to :user
end
