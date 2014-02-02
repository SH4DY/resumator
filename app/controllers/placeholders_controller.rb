class PlaceholdersController < ApplicationController
  before_action :set_placeholder, only: [:show, :edit, :update, :destroy]

  # GET /placeholders
  # GET /placeholders.json
  def index
    @placeholders = Placeholder.all
  end

  # GET /placeholders/1
  # GET /placeholders/1.json
  def show
  end

  # GET /placeholders/new
  def new
    @placeholder = Placeholder.new
  end

  # GET /placeholders/1/edit
  def edit
  end

  # POST /placeholders
  # POST /placeholders.json
  def create
    @placeholder = Placeholder.new(placeholder_params)

    respond_to do |format|
      if @placeholder.save
        format.html { redirect_to @placeholder, notice: 'Placeholder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @placeholder }
      else
        format.html { render action: 'new' }
        format.json { render json: @placeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placeholders/1
  # PATCH/PUT /placeholders/1.json
  def update
    respond_to do |format|
      if @placeholder.update(placeholder_params)
        format.html { redirect_to @placeholder, notice: 'Placeholder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @placeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placeholders/1
  # DELETE /placeholders/1.json
  def destroy
    @placeholder.destroy
    respond_to do |format|
      format.html { redirect_to placeholders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placeholder
      @placeholder = Placeholder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def placeholder_params
      params.require(:placeholder).permit(:position)
    end
end
