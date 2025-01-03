class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: { message: I18n.t("errors.messages.blank") }, length: { minimum: 5 }
  validates :content, presence: { message: I18n.t("errors.messages.blank") }, length: { minimum: 10 }

  def update_tags(tag_names)
    self.tags = tag_names.to_s.split(",").map do |name|
      Tag.find_or_create_by(name: name.strip)
    end
  end

  def self.tagged_with(name)
    tag = Tag.find_by(name: name)
    tag ? tag.posts : Post.none
  end
end
