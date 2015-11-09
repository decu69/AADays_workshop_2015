class LoginPage < BasePage
  @username = nil
  def initialize(session)
    super(session)
  end

  def mapNameToSelector(name)
    case name
      when 'username field'
        @username = name
        '#username'

      when 'password field'
        '#password'

      when 'log in button'
        '#login'

      else
        fail("There is no '#{name}' in the LoginPage object mapping definition!")
    end
  end



end