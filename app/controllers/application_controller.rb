class ApplicationController < ActionController::Base
    before_action :load_customers

    private

  def load_customers
    @customers = Customer.all
  end
end
