require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @tag = tags(:one)
    @post.tags << @tag
  end

  test "should not save post without title" do
    post = Post.new(content: "This is a post")
    assert_not post.save, "Saved the post without a title"
  end

  test "should not save post without content" do
    post = Post.new(title: "This is a title")
    assert_not post.save, "Saved the post without content"
  end

  test "should save post with title and content" do
    user = users(:one)
    post = Post.new(title: "This is a title", content: "This is a post", user: user)
    assert post.save, "Did not save the post with title and content"
  end

  test "should save post with tags" do
    user = users(:one)
    post = Post.new(title: "This is a title", content: "This is a post", user: user)
    post.tags << tags(:one)
    assert post.save, "Did not save the post with tags"
  end

  test "should not save post with duplicate tags" do
    post = Post.new(title: "This is a title", content: "This is a post")
    post.tags << tags(:one)
    post.tags << tags(:one)
    assert_not post.save, "Saved the post with duplicate tags"
  end

  test "should associate new tags with post" do
    tag = Tag.create(name: "new_tag")
    @post.update_tags("new_tag")
    assert_includes @post.tags, tag, "New tag was not associated with the post"
  end

  test "should associate existing tags with post" do
    tag = tags(:one)
    @post.update_tags("tag1, #{tag.name}")
    assert_includes @post.tags, tag, "Existing tag was not associated with the post"
  end

  test "should return posts tagged with a specific tag" do
    tagged_posts = Post.find_by_tag_name(@tag.name)
    assert_includes tagged_posts, @post, "Tagged posts were not retrieved correctly"
  end

  test "should return empty if no posts with tag" do
    tagged_posts = Post.find_by_tag_name("non_existing_tag")
    assert_empty tagged_posts, "Posts with non-existing tag were found"
  end

  test "should not associate duplicate tags with post" do
    @post.update_tags(@tag.name)
    assert_equal 1, @post.tags.where(name: @tag.name).count, "Duplicate tags were associated with the post"
  end

  test "should remove tags not included in update" do
    new_tag = Tag.create(name: "new_tag")
    @post.update_tags("new_tag")
    assert_not_includes @post.tags, @tag, "Old tag was not removed from the post"
    assert_includes @post.tags, new_tag, "New tag was not associated with the post"
  end

  test "should validate upload content" do
    valid_content = "Title post example#valid Content example---Another Title#Another Content#sml"
    invalid_content = "sml#sml#sml"
    assert Post.upload_content_valid?(valid_content), "Valid content was not recognized"
    assert_not Post.upload_content_valid?(invalid_content), "Invalid content was not recognized"
  end
end
