class Admin < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :timeoutable

  validates_presence_of :password
  validates_confirmation_of :password
end
