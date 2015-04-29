class User < ActiveRecord::Base
  has_secure_password
  has_one :address
  has_one :member_profile
  has_one :fitness_professional_profile
  has_one :user_type
end
