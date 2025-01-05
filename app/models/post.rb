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

  def self.upload_content_valid?(content_text)
    return false if content_text.blank?

    posts = content_text.split(">")
    posts.each do |post|
      title, content, = post.split("|")

      return false if title.blank?
      return false if content.blank?
    end
    true
  end

  def self.create_from_upload_content(content_text, user_id)
    user = User.find(user_id)

    posts = content_text.split(">")
    posts.each do |post|
      title, content, tags = post.split("|")

      post = Post.new(title: title, content: content, user: user)
      post.update_tags(tags)
    end
  end
end
