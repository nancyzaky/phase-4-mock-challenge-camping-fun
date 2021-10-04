class CampersController < ApplicationController
  wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    campers = Camper.all
    render json: campers
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if camper
    render json: camper, serializer: CamperActivitySerializer
    else
       render json: { error: "Camper not found" }, status: :not_found
    end
  end

  def destroy

  end
  def create
    camper = Camper.create!(camper_param)

    render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => e
  render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  private
def render_not_found_response
  render json: { error: "Camper not found" }, status: :not_found
end
def camper_param
params.permit(:name, :age)
end

end
