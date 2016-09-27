class Cart < ApplicationRecord

  has_many    :positions
  has_many    :items, through: :positions
  belongs_to  :user


end
