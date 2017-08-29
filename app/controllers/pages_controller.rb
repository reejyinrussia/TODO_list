class PagesController < ApplicationController
  def index
    @pages = Page.all

  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render :edit
    end
  end

  def create
    page = Page.new(page_params)
     #executes the sql to try to save the new page in the database
     if page.save
       # success - new record in the database
       redirect_to page_path(page)
     else
       # fail - failed to execute the sql for some reason
       render :new
     end
   end

   def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
   end

   private
    def page_params
      params.require(:page).permit(:title, :task, :private)

    end

end
