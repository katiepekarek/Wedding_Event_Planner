class Payment<ActiveRecord::Base
  validate :not_past_date
  belongs_to :budget

  def not_past_date
    if self.due_date && self.due_date.past?
      self.errors.add(:due_date, "can't be in the past")
    end
  end
end
