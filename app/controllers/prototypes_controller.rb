class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
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
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  private
  def prototype_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :copy, :concept, captured_images_attributes: [:name, :status]).merge(tag_list: tag_list)
  end
end
