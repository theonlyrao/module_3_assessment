class Store < OpenStruct

  def self.find_all_by_zip(zip_code)
    BestBuyService.stores_by_zip(zip_code)
  end
end
