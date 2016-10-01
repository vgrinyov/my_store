class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # default generated settings
=begin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
=end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :comments
end
