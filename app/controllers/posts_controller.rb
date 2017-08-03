# TODO: Really necessary?
require 'will_paginate/array'

class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    puts @post.community_id
    if @post.save
      flash[:success] = "Post created."
      redirect_back_or root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to request.referrer || root_url
  end

    def like
        @post = Post.find(params[:id])
        if current_user.liked? @post
            @post.unliked_by current_user
        else
            @post.liked_by current_user
        end

        if request.xhr?
            render json: { count: @post.get_likes.size, id: params[:id] }
        else
            redirect_to @post
        end
    end

  private

    def post_params
      params.require(:post).permit(:content, :picture)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
