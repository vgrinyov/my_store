class ItemsController < ApplicationController

  # Filters
  before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item.all
    render html: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
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
    unless @item
    #unless @item = Item.find_by(params[:id])
      render html: "Page no found", status: 404
    end
  end

  def expensive
    @item = Item.where("price > 1000")
    render "index"
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

  def item_params
    params.require(:item).permit(:id, :name, :description, :price, :weight )
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

end
