class TicketsController < ApplicationController
  before_filter :login_required
  before_filter :admin_required, :only => [:index, :show]
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    t_attr = params[:ticket].merge :user => current_user
    @ticket = Ticket.new(t_attr)
    if @ticket.save
	
	@ticket.category = Category.find(params[:category_id]) if params[:category_id]
      redirect_to @ticket, :notice => "Successfully created ticket."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to @ticket, :notice  => "Successfully updated ticket."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, :notice => "Successfully destroyed ticket."
  end
end
