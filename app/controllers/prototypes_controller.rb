class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  def index
    @prototypes = Prototype.order(created_at: :desc).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    prototype = current_user.prototypes.new(prototype_params)
    if prototype.save
      redirect_to root_path, success: "Successfully created your prototype."
    else
      redirect_to new_prototype_path, warning: "Unfortunately failed to create."
    end
  end

  def show
    @comment = current_user.comments.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
    if @prototype.update(update_params)
      redirect_to prototype_path(@prototype), success: "Successfully updated your prototype."
    else
      redirect_to edit_prototype_path, warning: "Unfortunately failed to update."
    end
  end

  def destroy
    @prototype.destroy
  end

  private
  def prototype_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :copy, :concept, captured_images_attributes: [:name, :status]).merge(tag_list: tag_list)
  end

  def update_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :copy, :concept, captured_images_attributes: [:id, :name, :status]).merge(tag_list: tag_list)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
