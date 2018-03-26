class PostsController < ApplicationController
   before action :find_post, only:[:show, :edit, :update, :destroy]
    
    def index 
        @posts = Post.all
end
    def show
end
    def new
        @posts = Post.new
    end
    def create
        @post = Post.new(posts_params)
        if @post.save
            redirect_to post, notice: "The post was created"
        else
            render 'new'
        end
    end
    def edit
    end
    def update 
         @post = Post.update(posts_params)
        redirect_to post, notice: "The update was sucessful"
    else
        render 'edit'
    end
    def destroy 
        @post.destroy
        redirect_to root_path, notice: "Post destroyed"
    end
private
    def posts_params
        params.require( :post).permit(:title, :content, :category_id)
    end
    def find_posts
        @post = Post.find(params[:id])
    end
end
        
       