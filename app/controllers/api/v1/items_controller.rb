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

  def create
    respond_with Item.create!(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
  
end
