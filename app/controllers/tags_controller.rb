class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_tag_path, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
