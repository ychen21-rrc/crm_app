class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.order(:full_name)
    render :index
  end

  def missing_email
    @customers = Customer.where(email: [nil, ""])
    render :index
  end
end
