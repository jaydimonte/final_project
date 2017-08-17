class UsersController < ApplicationController
  def index
    @users = User.all

    redirect_to("/users/show.html.erb")
  end

  def show
    @user = User.find(params[:id])

    @address = Address.all
    @order = Order.all
    @cycle = Cycle.all

    @user_cycles = Cycle.where(:user_id => current_user.id)
    @counter = 0
    
    # while @user_cycles.size > @counter 
    # # @current_cycle = @user_cycles.start_date.maximum
    #   @counter = @counter + 1 
    # end 
    
    # @starting = 0
    # @ending = 0
    # @cycle_length = 0
    # @time_between = 0
    
    
    render("/users/show.html.erb")
  end

end
