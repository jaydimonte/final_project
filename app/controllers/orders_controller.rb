class OrdersController < ApplicationController
  def index
    @orders = Order.all

    render("orders/index.html.erb")
  end

  def show
    @order = Order.find(params[:id])

    render("orders/show.html.erb")
  end

  def new
    @order = Order.new

    render("orders/new.html.erb")
  end

  def create
    @order = Order.new

    @order.user_id = params[:user_id]
    @order.super = params[:super]
    @order.medium = params[:medium]
    @order.lite = params[:lite]

    save_status = @order.save

    if save_status == true
      redirect_to("/orders/#{@order.id}", :notice => "Order created successfully.")
    else
      render("orders/new.html.erb")
    end
  end

  def edit
    @order = Order.find(params[:id])

    render("orders/edit.html.erb")
  end

  def update
    @order = Order.find(params[:id])

    @order.user_id = params[:user_id]
    @order.super = params[:super]
    @order.medium = params[:medium]
    @order.lite = params[:lite]

    save_status = @order.save

    if save_status == true
      redirect_to("/orders/#{@order.id}", :notice => "Order updated successfully.")
    else
      render("orders/edit.html.erb")
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy

    if URI(request.referer).path == "/orders/#{@order.id}"
      redirect_to("/", :notice => "Order deleted.")
    else
      redirect_to("/", :notice => "Order deleted.")
    end
  end
end
