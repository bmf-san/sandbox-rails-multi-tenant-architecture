class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  set_current_tenant_through_filter # Required to opt into this behavior
  before_action :set_tenant_as_tenant

  def set_tenant_as_tenant
    tenant = Tenant.find(current_user.tenant_id)
    set_current_tenant(tenant)
  end

  def index
    @posts = Post.preload(:comments)
    @all_posts = Post.ignore_valid_datetime
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to post_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

