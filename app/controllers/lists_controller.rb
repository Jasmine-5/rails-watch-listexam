class ListsController < ApplicationController
  before_action :list_params
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end


  # def show
  #   @bookmark = Bookmark.new
  #   @review = Review.new(list: @list)
  # end
