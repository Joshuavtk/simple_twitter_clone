class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    render json: @tag.to_json(include: :messages)
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag, notice: "Tag was successfully created."
    else
      render json: "Error creating"
    end
  end

  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: "Error updating"
    end
  end

  def destroy
    @tag.destroy
    render json: "Tag was successfully destroyed."
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
