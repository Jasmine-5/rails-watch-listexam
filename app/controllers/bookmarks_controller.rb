class BookmarksController < ApplicationController
  before_action :bookmarks_params

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def bookmarks_params
    params.require(:list).permit(:comment, :movie_id, :list_id)
  end
end
