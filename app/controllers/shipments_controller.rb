class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all

    render("shipments/index.html.erb")
  end

  def show
    @shipment = Shipment.find(params[:id])

    render("shipments/show.html.erb")
  end

  def new
    @shipment = Shipment.new

    render("shipments/new.html.erb")
  end

  def create
    @shipment = Shipment.new

    @shipment.order_id = params[:order_id]
    @shipment.cycle_id = params[:cycle_id]
    @shipment.address_id = params[:address_id]
    @shipment.user_id = params[:user_id]

    save_status = @shipment.save

    if save_status == true
      redirect_to("/shipments/#{@shipment.id}", :notice => "Shipment created successfully.")
    else
      render("shipments/new.html.erb")
    end
  end

  def edit
    @shipment = Shipment.find(params[:id])

    render("shipments/edit.html.erb")
  end

  def update
    @shipment = Shipment.find(params[:id])

    @shipment.order_id = params[:order_id]
    @shipment.cycle_id = params[:cycle_id]
    @shipment.address_id = params[:address_id]
    @shipment.user_id = params[:user_id]

    save_status = @shipment.save

    if save_status == true
      redirect_to("/shipments/#{@shipment.id}", :notice => "Shipment updated successfully.")
    else
      render("shipments/edit.html.erb")
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])

    @shipment.destroy

    if URI(request.referer).path == "/shipments/#{@shipment.id}"
      redirect_to("/", :notice => "Shipment deleted.")
    else
      redirect_to(:back, :notice => "Shipment deleted.")
    end
  end
end
