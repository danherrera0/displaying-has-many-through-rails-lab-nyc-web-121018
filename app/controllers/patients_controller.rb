class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    redirect_to patient_path(@patient)
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = Appointment.all
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.update(patient_params)
    redirect_to patient_path(@patient)
  end

  def destroy
    @doctor = Patient.find(params[:id])
    @doctor.destroy
    redirect_to patients_path
  end

  private

  def patient_prarams
    params.require(:patient).permit(:name, :age)
  end

end
