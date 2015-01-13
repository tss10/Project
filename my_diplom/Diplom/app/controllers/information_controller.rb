class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /information
  # GET /information.json
  def index
    @information = Information.all
  end

  # GET /information/1
  # GET /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        create_report(@information)
        format.html { redirect_to @information, notice: 'Данные отчета созданы.' }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: 'Данные отчета обновлены.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Данные отчета удалены.' }
      format.json { head :no_content }
    end
  end

  private

    def create_report(inf)
      string_out = ""
      t = "/mnt/storage1/users/t/ts/tss10/my_diplom/Diplom/public/"
      f1 =t+ inf.task_file.to_s.split("?")[0]
      f2 =t+ inf.code_file.to_s.split("?")[0]

      string_out += open(f1){ |file| file.read }
      inf.task_text = string_out
      string_out += "\n=============================\n\n"
      string_out += open(f2){ |file| file.read }

      rep  = Report.new()

      rep.report_text = string_out
      inf.save
      rep.save


    end
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:task_file, :code_file, :task_text, :user_id)
    end
end
