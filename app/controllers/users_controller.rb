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
    @shipments = Shipment.all
    
    @address = Address.new
    @order = Order.new
    @cycle = Cycle.new
    @shipment = Shipment.new

    @user_cycles = Cycle.where(:user_id => current_user.id)
    
    @recentcycle = @user_cycles.order("start_date DESC").first
    
    @nextcyclestart = @recentcycle.start_date + 30
    @nextcycleend = @recentcycle.end_date + 30
    
    @recentaddress = @addresses.order("updated_at DESC").first
    @recentorder = @orders.order("updated_at DESC").first

  # YOU WILL NEED TO CHANGE THIS  
  # @recentshipment = @shipments.order("updated_at DESC").first
    @nextshipment = @recentcycle.start_date + 25

    
    render("/users/show.html.erb")
  end

end
