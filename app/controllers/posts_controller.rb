class PostsController < ApplicationController
    :before_action :find_post only: [:show, :edit, :update, :destroy]

    def index
        @post=Post.all
    end

    def show
    end

    def create
        @post = Post.new(posts_params)

        if @post.save
            flash[:success] = "Post Created!"
            redirect_to @post
    end

    def new
        @post=Post.new
    end

    def edit
    end

    def update
        if @post.update(posts_params)
            redirect_to @post, notice: "Updated Successfully!"
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path, notice: "Deleted Successfully!"
    end

    private

    def posts_params
        params.require(:post)permit(:title, :content, :category_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end

