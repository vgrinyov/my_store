class Item < ApplicationRecord
  #attr_accessible :price, :name, :real, :weight, :description
  attr_accessor :price, :name, :real, :weight, :description

  validates :price, { numericality: { greater_than: 0, allow_nil: true}}
  validates :name, :description, presence: true

end
