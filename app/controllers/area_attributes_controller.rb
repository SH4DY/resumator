class AreaAttributesController < ApplicationController
  before_action :set_area_attribute, only: [:show, :edit, :update, :destroy]

  # GET /area_attributes
  # GET /area_attributes.json
  def index
    @area_attributes = AreaAttribute.all
  end

  # GET /area_attributes/1
  # GET /area_attributes/1.json
  def show
  end

  # GET /area_attributes/new
  def new
    @area_attribute = AreaAttribute.new
  end

  # GET /area_attributes/1/edit
  def edit
  end

  # POST /area_attributes
  # POST /area_attributes.json
  def create
    @area_attribute = AreaAttribute.new(area_attribute_params)

    respond_to do |format|
      if @area_attribute.save
        format.html { redirect_to @area_attribute, notice: 'Area attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @area_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @area_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_attributes/1
  # PATCH/PUT /area_attributes/1.json
  def update
    respond_to do |format|
      if @area_attribute.update(area_attribute_params)
        format.html { redirect_to @area_attribute, notice: 'Area attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @area_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_attributes/1
  # DELETE /area_attributes/1.json
  def destroy
    @area_attribute.destroy
    respond_to do |format|
      format.html { redirect_to area_attributes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_attribute
      @area_attribute = AreaAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_attribute_params
      params.require(:area_attribute).permit(:name, :value)
    end
end
