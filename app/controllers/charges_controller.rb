class ChargesController < ApplicationController
  before_action :require_member

  def new
  end

  def create
    # Amount in cents
    @amount = 1500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge.paid == true
      current_user.update_attributes(premium: true)
      flash[:notice] = "You have been successfully upgraded to a premium account!"
      redirect_to controller: 'private', action: 'index'
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def require_member
    unless current_user
      redirect_to new_user_registration_path
    end
  end

end
