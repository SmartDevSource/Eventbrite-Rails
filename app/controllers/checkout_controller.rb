class CheckoutController < ApplicationController
  protect_from_forgery except: :create

  @@event = Event.new

  def create
    @@event = Event.find_by(id: params[:event])
    @total = @@event.price.to_d

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    # session[:event_id] = @event;

    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    attendance = Attendance.new(attendee_id: current_user.id, event_id: @@event.id, stripe_customer_id: params[:session_id])

    attendance.save

  end

  def cancel

  end

end