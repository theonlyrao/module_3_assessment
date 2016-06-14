class StoresController < ApplicationController

  def index
    @stores = Store.find_all_by_zip(params[:zip])
  end

end
