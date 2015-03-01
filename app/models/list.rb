class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  validates_presence_of :title

  after_initialize :defaults

  def defaults
    self.permissions ||= 'private'
  end
end
