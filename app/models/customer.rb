class Customer < ApplicationRecord
  has_many :orders
  has_many :addresses
  has_many :cart_items
 def active_for_authentication?
    super && (is_deleted == false)
 end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
