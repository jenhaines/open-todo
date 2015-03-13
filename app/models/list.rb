class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  validates_presence_of :title

  after_initialize :defaults

  def self.all_available
    List.where(permissions: ["open", "viewable"])
  end
  
  def self.permission_options
    %w(private viewable open)
  end

  def defaults
    self.permissions ||= 'private'
  end
end
