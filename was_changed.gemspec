Gem::Specification.new do |s|
  s.name     = "was_changed"
  s.version  = "0.1.0"
  s.date     = "2008-10-25"
  s.summary  = "Dirty objects but more persistant"
  s.email    = "paul.bowsher@multiplay.co.uk"
  s.homepage = "http://github.com/multiplay/was_changed"
  s.description = "A Gemplugin to extend ActiveRecord's dirty objects to AFTER the save is called."
  s.has_rdoc = true
  s.authors  = ["Tom Preston-Werner", "Scott Chacon"]
  s.files    = ["lib/multiplay/was_changed.rb",
    "init.rb",
    "MIT-LICENSE",
    "Rakefile",
    "install.rb",
    "uninstall.rb",
    "README.markdown"]
  s.test_files = ["test/was_changed_test.rb",
  "test/test_helper.rb",
  "test/schema.rb",
  "test/database.yml"]
end
