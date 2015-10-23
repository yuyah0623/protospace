class PrototypesController < ApplicationController

  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    current_user.prototypes.create(create_params)
    redirect_to root_path
  end

  private
  def create_params
    tag_list = params[:prototype][:tag_list]
    params.require(:prototype).permit(:title, :copy, :concept, captured_images_attributes: [:name]).merge(tag_list: tag_list)
  end
end
