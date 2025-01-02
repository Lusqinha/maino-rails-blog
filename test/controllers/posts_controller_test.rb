require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { title: "New Post", content: "This is a new post", tag_names: "tag1, tag2" } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(id: @post.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(id: @post.id)
    assert_response :success
  end

  test "should update post" do
    patch post_url(id: @post.id), params: { post: { title: "Updated Title", content: "Updated content", tag_names: "tag1, tag2" } }
    assert_redirected_to post_url(id: @post.id)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(id: @post.id)
    end

    assert_redirected_to posts_url
  end

  test "should get index without authentication" do
    sign_out @user
    get posts_url
    assert_response :success
  end

  test "should not get new without authentication" do
    sign_out @user
    get new_post_url
    assert_redirected_to new_user_session_url
  end

  test "should not destroy post without authentication" do
    sign_out @user
    assert_no_difference("Post.count") do
      delete post_url(id: @post.id)
    end
    assert_redirected_to new_user_session_url
  end

  test "should not update post without authentication" do
    sign_out @user
    patch post_url(id: @post.id), params: { post: { title: "Updated Title", content: "Updated content, expecting error", tag_names: "tag1, tag2" } }
    assert_redirected_to new_user_session_url
  end

  test "should not create post with invalid data" do
    assert_no_difference("Post.count") do
      post posts_url, params: { post: { title: "", content: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "Should not update post with invalid data" do
    patch post_url(id: @post.id), params: { post: { title: "", content: "" } }
    assert_response :unprocessable_entity
  end
end
