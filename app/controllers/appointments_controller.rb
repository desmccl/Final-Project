class AppointmentsController < ApplicationController

  def show
    @customer = Customer.find(params[:customer_id])
    @appointment = @customer.appointments.find(params[:id])
  end

  
  def index
    @appointments = Appointment.all.includes(:customer, :animal)
    @customers = Customer.all
  end
  
    def new
      @customer = Customer.find(params[:customer_id])
      @appointment = @customer.appointments.new
      @animals = Animal.all
    end
  
    def create
      @customer = Customer.find(params[:customer_id])
      @appointment = @customer.appointments.new(appointment_params)
  
      if @appointment.save
        redirect_to customer_appointments_path(@customer)
      else
        render :new
      end
    end

    def edit
      if params[:customer_id]
        @customer = Customer.find(params[:customer_id])
        @appointment = @customer.appointments.find(params[:id])
      else
        @appointment = Appointment.find(params[:id])
        @customer = @appointment.customer
      end
      @animals = Animal.all
    end
    
    def update
      #debugger
      @customer = Customer.find(params[:customer_id])
      
      @appointment = @customer.appointments.find(params[:id])
      
      if @appointment.update(appointment_params)
        redirect_to customer_appointments_path(@customer), notice: "Appointment updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @customer = Customer.find(params[:customer_id])
      @appointment = @customer.appointments.find(params[:id])
      @appointment.destroy
      redirect_to customer_appointments_path(@customer), notice: "Appointment deleted successfully."
    end
    
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:animal_id, :scheduled_at)
    end
  end
  