class Store

  attr_reader :long_name, :city, :distance, :phone, :store_type

  def initialize(hash)
    @long_name = hash["longName"]
    @city = hash["city"]
    @distance = hash["distance"]
    @phone = hash["phone"]
    @store_type = hash["storeType"]
  end

  def self.find_all_by_zip(zip_code)
    raw_stores = BestBuyService.stores_by_zip(zip_code)
    stores = raw_stores["stores"].map do |raw_store|
      Store.new(raw_store)
    end
    { total: raw_stores["total"], stores: stores }
  end
end
