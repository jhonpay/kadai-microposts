class FavoritesController < ApplicationController

  def create
    unless current_user.favorite?(clicked_micropost)
      current_user.favorite(clicked_micropost)
      flash[:success] = '投稿に「いいね！」しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
      current_user.unfavorite(clicked_micropost)
      flash[:danger] = '「いいね！」を解除しました。'
      redirect_back(fallback_location: root_path)
  end

  private

  def clicked_micropost
    Micropost.find(params[:micropost_id])
  end
end