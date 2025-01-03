require "test_helper"

class PostTagTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @tag = tags(:one)
  end

  test "should not save post_tag without post_id" do
    post_tag = PostTag.new(tag_id: @tag.id)
    assert_not post_tag.save, "Saved the post_tag without a post_id"
  end

  test "should not save post_tag without tag_id" do
    post_tag = PostTag.new(post_id: @post.id)
    assert_not post_tag.save, "Saved the post_tag without a tag_id"
  end

  test "should save post_tag with post_id and tag_id" do
    post_tag = PostTag.new(post_id: @post.id, tag_id: @tag.id)
    assert post_tag.save, "Did not save the post_tag with post_id and tag_id"
  end
end
