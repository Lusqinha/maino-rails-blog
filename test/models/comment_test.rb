require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should require a post_id" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "should belong to a post" do
    assert_equal posts(:one), @comment.post
  end

  test "should belong to a user" do
    assert_equal users(:one), @comment.user
  end

  test "should allow comments without a user" do
    @comment.user = nil
    assert @comment.valid?
  end

  test "should require content" do
    @comment.content = nil
    assert_not @comment.valid?
  end

  test "should require content to be at least 2 characters" do
    @comment.content = "a"
    assert_not @comment.valid?
  end

  test "should require content to be at most 1000 characters" do
    @comment.content = "a" * 1001
    assert_not @comment.valid?
  end
end
