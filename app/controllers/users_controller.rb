class UsersController < ApplicationController
  def index
    @users = User.all

    # render("/users/index.html.erb")
    redirect_to("/users/#{current_user.id}")

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
    @cycle_lengths = []
    
    #CALCULATIONS
    
    @user_cycles.each do |user_cycle|
      start = Chronic.parse(user_cycle.start_date)
      finish = Chronic.parse(user_cycle.end_date)
      length = ( finish - start ) / 86400
      @cycle_lengths.push(length)
    end 
    
    @cycle_lengths = @cycle_lengths.sum / @cycle_lengths.count
    
    @previousend = [Time.now]
    @nextstart = []
    
    @user_cycles.each do |user_cycle|
      @previousend.push(Chronic.parse(user_cycle.end_date))
      @nextstart.push(Chronic.parse(user_cycle.start_date))
    end 
    
    @nextstart.push(Time.now)
    
    @arraybetween =  @nextstart - @previousend 
    
    # @arraybetween.each do |arraybetween|
    #   @newarray = 
    # end
    
    #FORM STUFF
    
    @recentcycle = @user_cycles.order("start_date DESC").first
    
    @nextcyclestart = @recentcycle.start_date + 30
    @nextcycleend = @nextcyclestart + @cycle_lengths
    
    @countdown =  Chronic.parse(@nextcyclestart) - Time.now
    @countdown = @countdown / 86400
    @countdown = @countdown.to_int 
    
    @recentaddress = @addresses.order("updated_at DESC").first
    @recentorder = @orders.order("updated_at DESC").first

  # YOU WILL NEED TO CHANGE THIS  
  # @recentshipment = @shipments.order("updated_at DESC").first
    @nextshipment = @nextcyclestart - 5

    
    
    
    render("/users/show.html.erb")
  end

def confirmshipment
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

    
    render("/users/confirmshipment.html.erb")
end

end
