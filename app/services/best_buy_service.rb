class BestBuyService

  attr_reader :conn, :key
  
  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com') do |faraday|
      faraday.request  :url_encoded      
      faraday.response :logger           
      faraday.adapter  Faraday.default_adapter
    end
    @key = ENV["BEST_BUY_KEY"]
  end

  def self.stores_by_zip(zip_code, radius=10, num_per_page=15)
    service = BestBuyService.new
    service.conn.get do |req|
      req.url "v1/stores(area(#{zip_code},#{radius})"
      req.params["format"] = "json"
      req.params["show"] = "longName,city,distance,phone,storeType"
      req.params["pageSize"] = num_per_page
      req.params["apiKey"] = ENV["BEST_BUY_KEY"]
    end
  end

  

end
