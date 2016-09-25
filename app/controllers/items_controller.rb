class ItemsController < ApplicationController
  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
  end

  # /items/1 GET var1
=begin
  def show
    if @item = Item.where(id: params[:id]).first
      render "items/show"
    else
      render text: "Page no found", status: 404
    end
  end
=end
  # /items/1 GET var2
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "Page no found", status: 404
    end
  end

  # /items/new  GET
  def new
  end

  # /items/1/edit  GET
  def edit
  end

  # /items/new  GET
  def new
  end

  # /items POST
  def create
    #@item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight])
    @item = Item.create(params[:item])
    render :plain => "#{@item.id}: #{@item.name} (#{@item.new_record?})"
  end

  # /items/1 PUT
  def update
  end

  # /items/1 DELETE
  def destroy
  end

end
