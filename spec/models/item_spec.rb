require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:order_items) }
  it { should have_many(:orders) }
end
