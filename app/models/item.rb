class Item < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :description

  def self.completed
    where(completed:  true)
  end
end
