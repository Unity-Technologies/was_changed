was_changed
==========

Based on [ActiveRecord Dirty Objects](http://ryandaigle.com/articles/2008/3/31/what-s-new-in-edge-rails-dirty-objects), was_changed extends changed? et al to persist past the object save.
As it's based on Dirty, I'll borrow the example from the announcement of Dirty.


Example
=======

	article = Article.find(:first)
	article.save
	article.was_changed?  #=> false
	
	# Track changes to individual attributes with
	# attr_name_was_changed? accessor
	article.title  #=> "Title"
	article.title = "New Title"
	article.title_changed? #=> true
	article.save
	article.title_was_changed? #=> true
	article.title_changed? #=> false
	
	# Access previous value with attr_name_before_save_was accessor
	article.title_before_save_was  #=> "Title"
	
	# See both previous and current value with attr_name_before_save_change accessor
	article.title_before_save_change  #=> ["Title", "New Title"]

	# Get a list of changed attributes
	article.was_saved  #=> ['title']

	# Get the hash of changed attributes and their previous and current values
	article.saved_changes  #=> { 'title' => ["Title", "New Title"] }

It uses Dirty's framework, so `will_change!` will also work:

	article = Article.find(:first)
	article.title_will_change!
	article.title.upcase!
	article.save
	article.title_before_save_change  #=> ['Title', 'TITLE'] 

Copyright (c) 2008 Multiplay (UK) Ltd., released under the MIT license
