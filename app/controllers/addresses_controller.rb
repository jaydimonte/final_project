class AddressesController < ApplicationController
  def index
    @addresses = Address.all

    render("addresses/index.html.erb")
  end

  def show
    @address = Address.find(params[:id])

    redirect_to("/addresses")
  end

  def new
    @address = Address.new

    render("addresses/new.html.erb")
  end

  def create
    @address = Address.new

    @address.user_id = params[:user_id]
    @address.address = params[:address]

    save_status = @address.save

    if save_status == true
      redirect_to("/addresses/#{@address.id}", :notice => "Address created successfully.")
    else
      render("addresses/new.html.erb")
    end
  end

  def edit
    @address = Address.find(params[:id])

    render("addresses/edit.html.erb")
  end

  def update
    @address = Address.find(params[:id])

    @address.user_id = params[:user_id]
    @address.address = params[:address]

    save_status = @address.save

    if save_status == true
      redirect_to("/addresses/#{@address.id}", :notice => "Address updated successfully.")
    else
      render("addresses/edit.html.erb")
    end
  end

  def destroy
    @address = Address.find(params[:id])

    @address.destroy

    if URI(request.referer).path == "/addresses/#{@address.id}"
      redirect_to("/", :notice => "Address deleted.")
    else
      redirect_to("/", :notice => "Address deleted.")
    end
  end
end
