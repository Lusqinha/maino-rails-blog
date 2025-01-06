class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: { message: I18n.t("errors.messages.blank") }, length: { minimum: 5 }
  validates :content, presence: { message: I18n.t("errors.messages.blank") }, length: { minimum: 10 }

  def update_tags(tag_names)
    post_tags.destroy_all
    return if tag_names.blank?

    tag_names = tag_names.split(",").map(&:strip).uniq

    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.downcase)
      puts(tag.errors.full_messages) if tag.errors.any?
      tags << tag
    end
  end

  def self.tagged_with(name)
    tag = Tag.find_by(name: name)
    tag ? tag.posts : Post.none
  end

  def self.upload_content_valid?(content_text)
    return false if content_text.blank?

    posts = content_text.split("---")
    posts.each do |post|
      title, content = post.split("#")

      return false if title.blank? || content.blank?
      return false if already_exists?(title, content)
    end
    true
  end

  def self.already_exists?(title, content)
    Post.where(title: title, content: content).exists?
  end

  def self.create_from_upload_content(content_text, user_id)
    user = User.find(user_id)

    posts = content_text.split("---")
    posts.each do |post|
      title, content, tags = post.split("#")

      post = user.posts.build(title: title, content: content)
      if post.save
        post.update_tags(tags)
      end
    end
  end
end
