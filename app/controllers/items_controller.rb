class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :set_list

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to list_path(@list), notice: 'Item was successfully created.'
    else
      redirect_to :back, notice: "Error creating item. Please try again."
    end

    # if @list.add(item_params[:description])
    #   redirect_to list_path(@list), notice: 'Item was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  def new
    @item = Item.new
  end

  def destroy
    @item.mark_complete
    redirect_to list_path(@list)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_list
    @list = @item ? @item.list : List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:description, :list_id, :completed)
  end
end
