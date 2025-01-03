require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end
  test "should create comment" do
    post post_comments_url(post_id: posts(:one).id), params: { comment: { content: "This is a comment" } }
    assert_redirected_to post_url(posts(:one))
  end

  test "should not create empty comment" do
    post post_comments_url(post_id: posts(:one).id), params: { comment: { content: "" } }
    assert_response :unprocessable_entity
  end

  test "should not create comment with less than 2 characters" do
    post post_comments_url(post_id: posts(:one).id), params: { comment: { content: "a" } }
    assert_response :unprocessable_entity
  end

  test "should not create comment with more than 1000 characters" do
    post post_comments_url(post_id: posts(:one).id), params: { comment: { content: "a" * 1001 } }
    assert_response :unprocessable_entity
  end
end
