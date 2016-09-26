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
    #unless @item = Item.find_by(params[:id])
      render html: "Page no found", status: 404
    end
  end

  # /items/new  GET
  def new
    @item = Item.new
  end

  # /items/1/edit  GET
  def edit
    @item = Item.find(params[:id])
  end

  # /items POST
  def create
    #params.permit!
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to items_path(@item), :notice => "Your item was saved" # /items/:id
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to items_path(@item), :notice => "Your item was saved" # /items/:id
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :description, :price, :weight )
  end
end
