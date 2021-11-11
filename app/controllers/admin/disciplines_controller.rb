class Admin::DisciplinesController < Admin::BaseController
  before_action :set_discipline, only: %i[ show edit update destroy ]

  # GET /disciplines or /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1 or /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines or /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)

    if @discipline.save
      flash[:notice] = 'Disciplina criado com sucesso.'
      redirect_to admin_disciplines_path
    else
      flash[:alert] = 'Erro ao cadastrar Disciplina, por favor corrigir!'
      render :new
    end
  end

  # PATCH/PUT /disciplines/1 or /disciplines/1.json
  def update
    if @discipline.update(discipline_params)
      flash[:notice] = 'Disciplina Atualizada com Sucesso.'
      redirect_to admin_disciplines_path
    else
      flash[:alert] = 'Erro ao atualizar Disciplina, por favor tente novamente!'
      render :edit
    end
  end

  # DELETE /disciplines/1 or /disciplines/1.json
  def destroy
    @discipline.destroy
    flash[:notice] = 'Disciplina excluida com sucesso.'
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discipline_params
      params.require(:discipline).permit(:name)
    end
end
