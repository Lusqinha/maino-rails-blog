class CreatePostsFromFileContentJob
  include Sidekiq::Job

  def perform(upload_text, user_id)
    unless Post.upload_content_valid?(upload_text)
      Rails.logger.error("Invalid content detected in upload text")
      return
    end

    Post.create_from_upload_content(upload_text, user_id)
  end
end
