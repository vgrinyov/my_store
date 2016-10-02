require 'spec_helper'

describe 'Order' do

  it 'calculates the total of the order' do
    item1 = Item.new(price: 2500)
    item2 = Item.new(price: 3500)

    order = Order.new
    order.items << item1
    order.items << item2

    order.calculate total
    expect(order.total).to eq(6000)
  end
end