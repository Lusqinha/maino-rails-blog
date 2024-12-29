class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: { message: I18n.t("errors.messages.blank") }
  validates :body, presence: { message: I18n.t("errors.messages.blank") }
end
