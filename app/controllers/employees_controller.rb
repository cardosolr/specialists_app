class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @specialities = Speciality.all
    @employee.specialities.build
  end

  # GET /employees/1/edit
  def edit
    @specialities = Speciality.all
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        @specialities = Speciality.all
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upspec
    redirect_to sovem
  end

  def sovem
    puts "isso aqui ta uma merda quero me"
    @employee = Employee.new(employee_params)
    @speciality = Speciality.new(speciality_param)
    #@specialities = Speciality.all

    respond_to do |format|
      if @speciality.save
        format.html { redirect_to new_employee_path, notice: 'Speciality Added!' }
        format.json { render :new, status: :created, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end 
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      #params.require(:employee).permit(:name, specialities_attributes: [:id, :name], :speciality_ids => [])
      params.require(:employee).permit(:name, :speciality_ids => [], specialities_attributes: [:id, :name, :_destroy])
    end

    def speciality_param
      params.require(:employee).permit(specialities_attributes: [:id, :name, :_destroy])
    end


end
