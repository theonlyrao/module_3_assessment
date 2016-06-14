class Api::V1::ItemsController < ApiController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    Item.destroy(params[:id])
    render json: {}, status: :no_content
  end

end
