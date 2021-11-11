class Admin::AttendancesController < Admin::BaseController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      flash[:notice] = 'Formulario criado com sucesso.'
      redirect_to admin_attendances_path
    else
      flash[:alert] = 'Erro ao cadastrar Formulario, por favor corrigir!'
      render :new
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    if @attendance.update(attendance_params)
      flash[:notice] = 'Formulario Atualizado com Sucesso.'
      redirect_to admin_attendances_path
    else
      flash[:alert] = 'Erro ao atualizar o Formulario, por favor tente novamente!'
      render :edit
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    flash[:notice] = 'Formulario excluido com sucesso.'
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:frequence, :class_school_id, :student_id)
    end
end
