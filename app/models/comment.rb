class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  validates :content, presence: { message: I18n.t("errors.messages.blank") }, length: { minimum: 2, maximum: 1000 }
end
