class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders = @orders.by_serial_number(params[:serial_number]) if params[:serial_number].present?
    @orders = @orders.by_email(params[:email]) if params[:email].present?
    @orders = @orders.by_genre(params[:genre]) if params[:genre].present?
    @orders = @orders.by_state(params[:state]) if params[:state].present?
    @orders = @orders.by_state(params[:offer]) if params[:offer].present?
    @orders = @orders.filter_by_date_range(params[:start_date].to_date..params[:end_date].to_date) if params[:start_date].present? && params[:end_date].present?
  end

  def submit
    order = Order.find(params[:id])
    if order.submit!
      flash[:notice] = "Order submitted."
    else
      flash[:alert] = "Order submit failed."
    end
    redirect_to admin_items_path
  end

  def pay
    order = Order.find(params[:id])
    if order.pay!
      flash[:notice] = "Order payed."
    else
      flash[:alert] = "Order pay failed."
    end
  end

  def cancel
    order = Order.find(params[:id])
    if order.cancel!
      flash[:notice] = "Order cancelled."
    else
      flash[:alert] = "Order cancel failed."
    end
  end
end
