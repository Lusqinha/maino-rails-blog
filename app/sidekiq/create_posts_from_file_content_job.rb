class CreatePostsFromFileContentJob
  include Sidekiq::Job

  def perform(upload_text, user_id)
    Post.create_from_upload_content(upload_text, user_id)
  end
end
