class Item < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :description

  def self.incomplete
    where(completed:  false)
  end

  def mark_complete
    update_attribute(:completed, true)
  end
end
