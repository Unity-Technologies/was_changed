require 'test/unit'
require File.dirname(__FILE__) + '/test_helper.rb'

class WasChangedTest < Test::Unit::TestCase

  def setup
    @post = create_test_post
  end

  def test_was_changed_is_false_if_no_changes_were_made
    @post.save
    assert !@post.was_changed?
  end

  def test_was_changed_is_true_if_changes_were_made
    @post.title = "New Title"
    @post.save
    assert @post.was_changed?
  end

  def test_memory_persists_for_one_save
    @post.title = "New Title"
    @post.save
    @post.save
    assert !@post.was_changed?
  end

  def test_attribute_changes_tracked
    @post.title = "New Title"
    @post.save
    assert @post.title_was_changed?
  end

  def test_previous_value_accessible
    @post.title = "New Title"
    @post.save
    assert_equal @post.title_before_save_was, "Title"
    assert_equal @post.title_before_save_change, ["Title", "New Title"]
  end

  def test_changed_attribute_list
    @post.title = "New Title"
    @post.save
    assert_equal @post.was_saved, ["title"]
  end

  def test_change_hash
    @post.title = "New Title"
    @post.save
    assert_equal @post.saved_changes, { 'title' => ["Title", "New Title"] }
  end

  def test_will_change
    @post.title_will_change!
    @post.title.upcase!
    @post.save
    assert_equal @post.title_before_save_change, ["Title", "TITLE"]
  end

  def teardown
    @post.destroy
  end

end
