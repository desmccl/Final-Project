class AppointmentsController < ApplicationController

  def show
    @customer = Customer.find(params[:customer_id])
    @appointment = @customer.appointments.find(params[:id])
  end

  
    def index
      @appointments = Appointment.all
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
      @customer = Customer.find(params[:customer_id])
      @appointment = @customer.appointments.find(params[:id])
      @animals = Animal.all
    end
    
    def update
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
  