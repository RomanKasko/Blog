class Article < ApplicationRecord
  include Visible

  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :img_elements
  has_many :taggings,dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user
  validates_presence_of :user_id

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.tagged_with(name)
    Tag.find_by!(name: name).articles
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

end
