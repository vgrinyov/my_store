class ItemsController < ApplicationController

  # Filters
  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item
    @items = @items.where("price >= ?", params[:price_from]) if params[:price_from]
    @items = @items.where("created_at >= ?", 1.day.ago) if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
    @items = @items.order("votes_count DESC", "price")
    @items = @items.includes(:image)
  end

  def expensive
    @item = Item.where("price > 1000")
    render "index"
  end

  # /items/1 GET
  def show
    unless @item
      render html: "Page no found", status: 404
    end
  end

  # /items/new  GET
  def new
    @item = Item.new
  end

  # /items/1/edit  GET
  def edit
  end

  # /items POST
  def create
    params.permit!
    @item = Item.new(item_params)
    if @item.errors.empty?
      @item.save
      redirect_to items_path(@item), :notice => "Your item was saved" # /items/:id
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to items_path(@item), :notice => "Your item was saved" # /items/:id
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: index
  end

  private

=begin
  def item_params
    params.require(:item).permit(:id, :name, :description, :price, :weight )
  end
=end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

end
