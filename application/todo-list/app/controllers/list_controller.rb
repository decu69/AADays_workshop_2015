class ListController < ApplicationController
  def checkAuthentication
    if !cookies[:SESSION]
      redirect_to '/users/login'
      return false
    end

    return true
  end

  def current_user
    cookies[:SESSION].split(':')[0]
  end


  def view
    if checkAuthentication()
      @list = List.where(:id => params[:id]).first
      @current_user = current_user

      if @list.user.username != current_user
        redirect_to '/'
        return
      end
    end
  end

  def toggle_product
    if checkAuthentication()
      list = List.where(:id => params[:id]).first

      if list.user.username != current_user
        redirect_to '/'
        return
      end

      product = list.products.where(:id => params[:productId]).first

      if product.closed
        product.open!
      else
        product.close!
        product.quantity = 0
      end

      product.save!
      list.save!
    end

    head :ok
  end

  def new_product
    if checkAuthentication()
      list = List.where(:id => params[:id]).first

      if list.user.username != current_user
        redirect_to '/'
        return
      end

      if list.products.where(:title => params[:title]).first
        head :conflict
      else
        list.products.build(:title => params[:title], :quantity => params[:quantity])

        list.save!
        head :ok
      end
    else
      head :ok
    end
  end

  def update_product
    if checkAuthentication()
      list = List.where(:id => params[:id]).first

      if list.user.username != current_user
        redirect_to '/'
        return
      end

      product = list.products.where(:id => params[:productId]).first

      if params[:quantity]
        product.quantity = params[:quantity]
      else
          if product.quantity >= 1
            product.quantity -= 1
            end
      end

      product.save!
      list.save!
      head :ok
      end
  end

  def delete_product
    if checkAuthentication()
      list = List.where(:id => params[:id]).first

      if list.user.username != current_user
        redirect_to '/'
        return
      end

      list.products.where(:id => params[:productId]).first.destroy
      list.save!
    end

    head :ok
  end

  def reopen_list
    if checkAuthentication()
      list = List.where(:id => params[:id]).first

      if list.user.username != current_user
        redirect_to '/'
        return
      end

      list.reopen!
    end

    head :ok
  end
end