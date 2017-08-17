class UsersController < ApplicationController
  def index
    @users = User.all

    render("/users/index.html.erb")
  end

  def show
    @user = User.find(current_user.id)

    @addresses = Address.all
    @orders = Order.all
    @cycles = Cycle.all
    
    @address = Address.new
    @order = Order.new
    @cycle = Cycle.new
    

    @user_cycles = Cycle.where(:user_id => current_user.id)
    
    @currentcycle = @user_cycles.order("start_date DESC").first
    
    @nextcyclestart = @currentcycle.start_date + 30
    @nextcycledend = @currentcycle.end_date + 30
    
    
    render("/users/show.html.erb")
  end

end
