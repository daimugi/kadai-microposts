class FavoritesController < ApplicationController
  before_action  :require_user_logged_in
  
  def create
    #お気に入りするためのマイクロポストを探す
    micropost = Micropost.find(params[:micropost_id])
    #今のアカウントでお気に入りに登録する
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りから削除しました'
    redirect_to likes_user_path(current_user)
  end
end
