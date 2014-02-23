# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

language_a = Language.create(:language => "English")
language_b = Language.create(:language => "Other")
channel_a = Channel.create(:name => "Automotive")
channel_a = Channel.create(:name => "Business &amp; Finance")
channel_a = Channel.create(:name => "Education")
channel_a = Channel.create(:name => "Entertainment")
channel_a = Channel.create(:name => "Family &amp; Parenting")
channel_a = Channel.create(:name => "Gaming")
channel_a = Channel.create(:name => "Food &amp; Drink")
channel_a = Channel.create(:name => "Government &amp; Politics")
channel_a = Channel.create(:name => "Home &amp; Architecture")
channel_a = Channel.create(:name => "Pets")
channel_a = Channel.create(:name => "Sports")
channel_a = Channel.create(:name => "Style &amp; Beauty")
channel_a = Channel.create(:name => "Start Ups")
channel_a = Channel.create(:name => "Technology")
channel_a = Channel.create(:name => "Travel")
channel_a = Channel.create(:name => "Web Design &amp; Development")
channel_a = Channel.create(:name => "Weddings")
channel_a = Channel.create(:name => "Visual Arts &amp; Design")