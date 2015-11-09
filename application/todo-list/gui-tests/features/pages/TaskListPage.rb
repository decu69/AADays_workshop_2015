class TaskListPage < BasePage
  include Ajax

  def initialize(session)
    super(session)
  end

  def selectCheckBoxNearName(name)
    @session.find(
      :xpath,
      "/html/body/section/ul/li/div/span[contains(text(), '#{name}')]/../preceding-sibling::label"
    )
  end

  def mapNameToSelector(name)
    case name
      when 'new product name'
        '#product_name'

      when 'product quantity'
        '#product_quantity'

      when 'add button'
        '#add-new-product'

      else
        fail("There is no '#{name}' in the TaskListPage object mapping definition!")
    end
  end

  def checkNear(name)
    selectCheckBoxNearName(name).click
  end

end