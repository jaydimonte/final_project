class UsersController < ApplicationController
  def index
    @users = User.all

    @check0 = Cycle.where(:user_id => current_user.id)
    @check1 = Address.where(:user_id => current_user.id)
    @check2 = Order.where(:user_id => current_user.id)


    if @check0.count <= 1 
      redirect_to("/cycles")
    else if @check1.count < 1
      redirect_to("/addresses")
    else if @check2.count < 1
      redirect_to("/orders")
    else if 
      # render("/users/index.html.erb")
      redirect_to("/users/#{current_user.id}")
    end
    end 
    end
    end
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
    
    if @cycle_lengths.count != 0
      @cycle_lengths = @cycle_lengths.sum / @cycle_lengths.count
    end
    
    @previousend = []
    @nextstart = []
    
    @user_cycles.each do |user_cycle|
      @previousend.push(Chronic.parse(user_cycle.end_date))
      @nextstart.push(Chronic.parse(user_cycle.start_date))
    end 
    
    @previousend = @previousend.sort
    @nextstart = @nextstart.sort
    
    @counter = 0
    @arraybetween = []
    
    while @counter < ( @nextstart.count - 1)
      if @counter == 0 
        @counter = @counter + 1
      else 
        # @arraybetween.push(Chronic.parse(@previousend[@counter + 1].to_s) - Chronic.parse(@nextstart[@counter].to_s)) 
        @arraybetween.push(Chronic.parse(@nextstart[@counter + 1].to_s) - Chronic.parse(@previousend[@counter].to_s)) 
        @counter = @counter + 1
      end
    end
    
    if @arraybetween.count != 0
      @timebetween = ( @arraybetween.sum / @arraybetween.count ) / 86400
      @timebetween = @timebetween.to_int
    end 
    
    #FORM STUFF
    
    @recentcycle = @user_cycles.order("start_date DESC").first
    
    @nextcyclestart = @recentcycle.start_date + @timebetween
    @nextcycleend = @nextcyclestart + @cycle_lengths
    
    @countdown =  Chronic.parse(@nextcyclestart) - Time.now
    @countdown = @countdown / 86400
    @countdown = @countdown.to_int 
  
  
    @nextshipment = @recentcycle.start_date - 5
    
    @recentaddress = Address.where(:user_id => current_user.id).order("updated_at DESC").first
    
    @recentorder = Order.where(:user_id => current_user.id).order("updated_at DESC").first
   
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