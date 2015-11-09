def createPageObject(pageName)
  case pageName
    when 'log in'
      LoginPage.new(Capybara.current_session)

    when 'lists'
    	ListsPage.new(Capybara.current_session)

    else
      fail("There is no page object for '#{pageName}'!")
  end
end

Given(/^I am on (.+)? page$/) do |pageName|
  @page = createPageObject(pageName)
  @page.visit
end

When(/^I go to (.+?) page$/) do |pageName|
  @page = createPageObject(pageName)
  @page.visit
end

#When(/^I wait until pending requests will finish$/) do
#  @page.waitForPendingRequests(@page.getSession())
#end

Given(/^I am logged in$/) do
  @login_page = createPageObject("log in")
  @login_page.visit
  @login_page.type("krystian", "username field")
  @login_page.type("test", "password field")
  @login_page.click("log in button")
end

When(/^I enter correct login and password$/) do
  @page.type("krystian", "username field")
  @page.type("test", "password field")
  @page.click("log in button")
end
