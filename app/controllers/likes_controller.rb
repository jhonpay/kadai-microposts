class LikesController < ApplicationController
    before_action :require_user_logged_in
    
    def index
      if logged_in?
         @likes = current_user.likes.order(id: :desc).page(params[:page])
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
