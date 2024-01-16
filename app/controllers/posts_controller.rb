class PostsController < ApplicationController
    before_action :check_admin, only: [:new, :create, :destroy, :edit, :update]
    
    def index
        @current_post = Post.last
        @posts = Post.all
        @categories = Category.all
    end

    def show
        @current_post = Post.find(params[:id])
        @posts = Post.all
        @categories = Category.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        print @post
        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path, status: :see_other
    end

    private

    def post_params
        params.require(:post).permit(:title, :date, :content, :category_id)
    end

    def check_admin
        redirect_to root_path unless current_user.admin?
        flash[:danger] = "No Access to that"
    end
end
