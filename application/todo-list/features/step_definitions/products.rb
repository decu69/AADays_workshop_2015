Then(/^"([^"]+)" item will be closed$/) do |taskName|
  product = createProductIfNotExist(taskName)
  product.close!
  product.save!
end

Then(/^"([^"]+)" item will be opened$/) do |taskName|
  product = createProductIfNotExist(taskName)
  product.save!
end

Then(/^"([^"]+)" item should be opened$/) do |taskName|
  Product.where(:title => taskName).first.closed.should == false
end

Then(/^"([^"]+)" item should be closed$/) do |taskName|
  Product.where(:title => taskName).first.closed.should == true
end

Then(/^(\d+) product in "([^"]+)" is available$/) do |tasksNumber, listName|
  List.where(:name => listName).first.products.count.should == tasksNumber.to_i
end

Then(/^"([^"]+)" item should have today's date$/) do |taskName|
  Product.where(:title => taskName).first.date.should == Date.today
end