class CyclesController < ApplicationController
  def index
    @cycles = Cycle.all

    render("cycles/index.html.erb")
  end

  def show
    @cycle = Cycle.find(params[:id])

    render("cycles/show.html.erb")
  end

  def new
    @cycle = Cycle.new

    render("cycles/new.html.erb")
  end

  def create
    @cycle = Cycle.new

    @cycle.start_date = params[:start_date]
    @cycle.end_date = params[:end_date]
    @cycle.user_id = params[:user_id]

    save_status = @cycle.save

    if save_status == true
      @check = Cycle.where(:user_id => current_user.id)
      @check1 = Address.where(:user_id => current_user.id)
      @check2 = Order.where(:user_id => current_user.id)
      if @check.count <= 1 or @check1.count < 1 or @check2.count < 1
      redirect_to("/cycles/#{@cycle.id}", :notice => "Cycle created successfully.")
      else
      redirect_to("/users/confirmshipment", :notice => "Cycle created successfully.")
      end
    else
      render("cycles/new.html.erb")
    end
  end

  def edit
    @cycle = Cycle.find(params[:id])

    render("cycles/edit.html.erb")
  end

  def update
    @cycle = Cycle.find(params[:id])

    @cycle.start_date = params[:start_date]
    @cycle.end_date = params[:end_date]
    @cycle.user_id = params[:user_id]

    save_status = @cycle.save

    if save_status == true
      redirect_to("/cycles/#{@cycle.id}", :notice => "Cycle updated successfully. Now please confirm your next shipment")
    else
      render("cycles/edit.html.erb")
    end
  end

  def destroy
    @cycle = Cycle.find(params[:id])

    @cycle.destroy

    if URI(request.referer).path == "/cycles/#{@cycle.id}"
      redirect_to("/", :notice => "Cycle deleted.")
    else
      redirect_to("/", :notice => "Cycle deleted.")
    end
  end
end
