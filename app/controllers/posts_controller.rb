class PostsController < ApplicationController 
    before_action :check_author, only: [:edit, :update]

    def check_author
        @post = current_user.posts.find(params[:id])
        render json: "Not Allowed", status: 422 unless @post
    end 

    def new
        @post = Post.new
        render :new
    end 

    def create
        @post = Post.new(post_params)
        @post.subs_id = params[:subs_id]
        @post.author_id = params[:author_id]

        if @sub.save
            redirect_to sub_url(params[:sub_id])
        else 
            flash[:errors] = @sub.errors.full_messages
            redirect_to sub_url(params[:sub_id])
        end 
    end 

    def edit
        render :edit
    end 

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)

        if @post.save
            redirect_to post_url(params[:id])
        else 
            flash[:errors] = @post.errors.full_messages
            redirect_to sub_url(params[:sub_id])
            #redirect to post show
        end 
    end 

    def show
        @post = Post.find(params[:id])
        render :show
    end 

    def destroy
        @post = current_user.posts.find(params[:id])

        if @post && post.destroy
            redirect_to users_url
        end 
    end 

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end 

end 