class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: { message: I18n.t("errors.messages.blank") }
  validates :content, presence: { message: I18n.t("errors.messages.blank") }

  def update_tags(tag_names)
    self.tags = tag_names.split(",").map do |name|
      Tag.find_or_create_by(name: name.strip)
    end
  end
end
