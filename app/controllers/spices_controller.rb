class SpicesController < ApplicationController
 # GET /spices
 def index
    spices = Spice.all
    render json: spices
  end

  # GET /spices/:id
  def show
    spice = Spice.find_by(id: params[:id])
    render json: spice
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  #PATCH /spice/:id
  def update
    spice = Spice.find_by(id: params[:id])

    if spice
    spice.update(spice_params)
    render json: spice
   else
    render json: { error: "spice not found" }, status: :not_found
   end
  end

#DELETE/spice/:id
  def destroy
    spice = Spice.find(params[:id])
    if spice
    spice.destroy
    render json:{} #head:not_found
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end

