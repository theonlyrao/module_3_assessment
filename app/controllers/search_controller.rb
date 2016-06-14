class SearchController < ApplicationController

  def show
    @stores = Store.find_all_by_zip(params[:zip])
  end

end
