require "test_helper"

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:one)
    @post = posts(:one)
  end

  test "should not save tag without name" do
    tag = Tag.new
    assert_not tag.save, "Saved the tag without a name"
  end

  test "should save tag with name" do
    tag = Tag.new(name: "New Tag")
    assert tag.save, "Did not save the tag with a name"
  end

  test "should not save tag with duplicate name" do
    tag = Tag.new(name: @tag.name)
    assert_not tag.save, "Saved the tag with a duplicate name"
  end

  test "should return posts tagged with a specific tag" do
    tagged_posts = @tag.posts
    assert_includes tagged_posts, @post, "Tagged posts were not retrieved correctly"
  end
end
