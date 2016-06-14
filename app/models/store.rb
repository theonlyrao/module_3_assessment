class Store

  def initialize
    
  end

  def self.find_all_by_zip(zip_code)
    raw_stores = BestBuyService.stores_by_zip(zip_code)
    stores = raw_stores["stores"].each do |raw_store|
      Store.new(raw_store)
    end
    byebug
  end
end
