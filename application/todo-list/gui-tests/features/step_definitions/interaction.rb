Given(/^I opened "([^"]+)"$/) do |listName|
  @page = @page.followByName(listName)
end

Given(/^I typed "([^"]+)" into (.+?)$/) do |text, name|
  @page.type(text, name)
end

Given(/^I clicked (.+?)$/) do |name|
  @page.click(name)
end

Given(/^I cleared (.+?)$/) do |name|
  @page.type("", name)
end

When(/^I click (.+?)$/) do |name|
  @page.click(name)
end

When(/^I type "([^"]+)" into (.+?)$/) do |text, name|
  @page.type(text, name)
end

When(/^I mark checkbox near "([^"]+)"$/) do |name|
  @page.checkNear(name)
end


Given(/^I add "([^"]+)" list$/) do |name|
  @page.type(name, "new list field")
  @page.click("add button")
end

Given(/^I add (\d+) "([^"]+)" product$/) do |name|
  @page.type(name, "new task field")
  @page.click("add button")
end

When(/^I buy "([^"]+)" and mark this on my list$/) do |name|
  @page.checkNear(name)
  @page.waitForPendingRequests(@page.getSession())
end