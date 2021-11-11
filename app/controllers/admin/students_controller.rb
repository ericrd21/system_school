class Admin::StudentsController < Admin::BaseController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = 'Aluno(a) criado com sucesso.'
      redirect_to admin_students_path
    else
      flash[:alert] = 'Erro ao cadastrar Aluno(a), por favor corrigir!.'
      render :new
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    if @student.update(student_params)
      flash[:notice] = 'Aluno(a) atualizado com Sucesso.'
      redirect_to admin_students_path
    else
      flash[:alert] = 'Erro ao atualizar Aluno(a), por favor tente novamente!'
      render :edit
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    flash[:notice] = 'Aluno(a) excluido com sucesso.'
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :address, :phone, :birthday, :user_id, :class_school_id)
    end
end
