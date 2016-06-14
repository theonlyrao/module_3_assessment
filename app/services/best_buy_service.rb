class BestBuyService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request  :url_encoded      
      faraday.response :logger           
      faraday.adapter  Faraday.default_adapter
    end
    @key = ENV["BEST_BUY_KEY"]
  end

  def self.stores_by_zip(zip_code)
    @conn.get do |req|
      req.url '/search'
      req.params['limit'] = 100
    end
  end

  

end
