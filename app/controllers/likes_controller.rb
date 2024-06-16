class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to @post, notice: 'You liked this post.'
    else
      redirect_to @post, alert: 'Unable to like this post.'
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)

    if @like.destroy
          redirect_to @post, notice: 'You unliked this post.'
    else
      redirect_to @post, alert: 'Unable to unlike this post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
