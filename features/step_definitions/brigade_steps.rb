Given(/^I have brigades titled (.+)$/) do |titles|
  titles.split(', ').each{ |arg| FactoryGirl.create(:brigade, name: arg) }
end

Given(/^I have no brigades$/) do
  Brigade.delete_all
end

Given(/^I have countries titled (.+)$/) do |titles|
  titles.split(', ').each{ |arg| FactoryGirl.create(:country, name: arg) }
end


Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

Given(/^I have brigade titled "(.*?)" with tags "(.*?)"$/) do |name, tags|
  FactoryGirl.create(:brigade, name: name, tag_list: tags)
end

When(/^I go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I follow "(.*?)"$/) do |arg|
  click_on(arg)
end

When(/^I press "(.*?)"$/) do |arg|
  click_on(arg)
end

When(/^I press first link "(.*?)"$/) do |arg|
  first(:link, arg).click
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I choose the country \- "(.*?)"$/) do |value|
  select(value, from: 'brigade[country_id]')
end

Then(/^I should see "(.*?)"$/) do |arg|
  page.should have_content(arg)
end

Then(/^I should not see "(.*?)"$/) do |arg|
  page.should_not have_content(arg)
end

Then(/^I should have (\d+) brigade$/) do |count|
  Brigade.count.should eq(count.to_i)
end
