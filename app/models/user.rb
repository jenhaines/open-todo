class User < ActiveRecord::Base
  has_many :lists
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true

  def can?(action, list)
    case list.permissions
    when 'private'  then owns?(list)
    when 'visible'  then action == :view
    when 'open' then true
    else false
    end
  end

  private

  def owns?(list)
    list.user_id == id
  end
  
end
