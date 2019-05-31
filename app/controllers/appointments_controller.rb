class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :edit, :delete]
  def index
    @appointments = @doctor.appointments
  end

  def new
    @drs = Doctor.all
    @appointment = @doctor.appointments.new
  end

  def show
  end

  def edit
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def delete
    @doctor.appointments.destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end
