class AdminController < ApplicationController
    def new
    end

  def create
    user = Admin.first
    if user.password == params[:session][:password]
        session[:current_user] = "admin"     
        redirect_to admin_dashboard_path
    else
    redirect_to admin_path
    end
  end

  def destroy
  end
  
    def admin_dashboard
        @videos = Page.all  
    end
    
    def logout
        if session[:current_user] != "admin"
           redirect_to index_path 
        
        else
            session[:current_user] = nil
            redirect_to index_path
        end
    end
  
end
