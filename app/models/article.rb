class Article < ApplicationRecord
  include Visible

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :img_elements

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
