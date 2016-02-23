class Api::V1::RestaurantsController < Api::V1::BaseController

  def show
    @rest = Restaurant.find_by_id(params[:id])
    if @rest.nil?
      render json: { errors: "Cound't find restaurant. Sure you wrote the right Id?" }, status: :not_found
    else
      respond_with :api, @rest
    end
  end

  def index
    respond_with Restaurant.all.sort_by { |e| e[:name]}
  end

  def create
    @rest = Restaurant.new(restaurants_params)
    if Restaurant.find_by_name(@rest.name).present?
      render json: { errors: "This restaurant already exist in the database" }, status: :conflict
    else
      if @rest.save
        respond_with :api, @rest, status: 201
      else
        render json: { errors: @rest.errors.messages }, status: :bad_request
      end
    end
  end

  #def update
  #  respond_with Restaurant.update(params[:id], params[:products])
  #end

  def destroy
    if @rest = Restaurant.find_by_id(params[:id])
      @rest.destroy
      render json: { action: "destroy", message: "The restaurant '#{@rest.name}' is now removed.", status: :ok}
    else
      render json: { errors: "Cound't find restaurant. Sure you wrote the right Id?" }, status: :not_found
    end
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :description, :stars)
  end

end
