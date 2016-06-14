class BestBuyService

  attr_reader :conn, :key
  
  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request  :url_encoded      
      faraday.response :logger           
      faraday.adapter  Faraday.default_adapter
    end
    @key = ENV["BEST_BUY_KEY"]
  end

  def self.stores_by_zip(zip_code)
    service = BestBuyService.new
    service.conn.get do |req|
      req.url "/stores(postalCode=#{zip_code})"
      req.params["format"] = "json"
      req.params["show"] = "longName,city,distance,phone,storeType"
      req.params["apiKey"] = ENV["BEST_BUY_KEY"]
    end
  end

  

end
