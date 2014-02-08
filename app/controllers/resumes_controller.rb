class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @resume = Resume.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ResumePdf.new(@resume, view_context)
        send_data pdf.render, filename: "resume_#{@resume.name}_#{current_user().name}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    @areas = Area.where("user_id = ?", current_user().id)
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user().id

    respond_to do |format|
      if @resume.save #Dont even save placeholders if resume couldn't be saved
        sorting = session[:sorting]
        sorting.each_with_index do |id, index|
          Placeholder.create(position: index, area_id: id,
                              resume_id: @resume.id) if id #Don't save empty array elements
        end
        session[:sorting] = nil
        format.html { redirect_to @resume, notice: 'Resume was successfully created. Including placeholders' }
        format.json { render action: 'show', status: :created, location: @resume }
      else
        format.html { render action: 'new' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  #This gets called everytime a area is dropped onto a droppable
  #resume OR removed (dragged out or resetted) from a resume
  def sort_areas
    position = params[:position]
    area_id = params[:area_id]

    if !session.has_key?(:sorting) #check if the user is already sorting
      session[:sorting] = Array.new
      array = session[:sorting]
    else
      array = session[:sorting]
    end

    array[position.to_i] = area_id
    render nothing: true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name)
    end
  end
