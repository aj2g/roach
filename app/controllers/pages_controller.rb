class PagesController < ApplicationController
    
    def index
       
        @videos = Page.all
    end
    
    def new
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            
            @page = Page.new
        end
    end

    def create
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            @page = Page.create!(page_params)
        
            redirect_to index_path
        end
    end
    
    def page_params
        params.require(:page).permit(:post, :title, :body, :video)
    end
    
    def info
       
    end
    
    def show
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            id = params[:id]
            @video = Page.find(id)
        end
    end
    
    def edit
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            id = params[:id]
            @page = Page.find(id)
        end
    end
    
    def update
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            @page = Page.find params[:id]
            @page.update_attributes!(page_params)
            flash[:notice] = "#{@page.title} was successfully updated."
            redirect_to page_path(@page)
        end
    end
    
    def destroy
        if session[:current_user] != "admin"
           redirect_to index_path 
        else
            @page = Page.find(params[:id])
            @page.destroy
        
            redirect_to admin_dashboard_path
        end
    end
    
   
    
    
    
    
    
end
