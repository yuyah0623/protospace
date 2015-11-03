class LikesController < ApplicationController

  before_action :set_prototype, only: [:create]

  def create
    @prototype.likes.create(like_params)
  end

  def destroy
    Like.find_by(prototype_id: params[:id], user_id: current_user.id).destroy
    @prototype = Prototype.find(params[:id])
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def like_params
    params.permit(:prototype_id).merge(user_id: current_user.id)
  end
end
