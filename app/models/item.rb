class Item < ApplicationRecord

=begin
  attr_reader :image_crop_data
=end
  validates :price, { numericality: { greater_than: 0, allow_nil: true}}
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_and_belongs_to_many :orders

  # code for uploader and redact image
=begin
  mount_uploader :image, ImageUploader

  def crop_image!(c)
    c.each { |k,v| = v.to_i}
    p c
    @image_crop_data = c
    image.recreate_versions!
  end
=end

  # callbacks
=begin
  after_initialize { puts "initialized"} # Item.new; Item.first
  after_save { puts "saved"} # Item.save; Item.create; item.update_attributes()
  after_create { puts "created"}
  after_update { puts "updated"}
  after_destroy {puts "destroyed"} # item.destroy
=end
end
