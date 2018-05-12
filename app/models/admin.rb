class Admin < ApplicationRecord
    
    
    def new
    end

  def create
    user = Admin.first
    if user.password == session[:password]
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
  end
end
