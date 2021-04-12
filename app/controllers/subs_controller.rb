class SubsController < ApplicationController 

    before_action :check_owner, only: [:edit, :update]
    before_action :logged_in?, except: [:index]

    def check_owner
        @sub = current_user.subs.find(params[:id])
        render json: "Not Allowed", status: 422
    end 

    def index 
        @subs = Sub.all
        render :index
    end 

    def new 
        @sub = Sub.new
        render :new
    end 

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = params[:user_id]

        if @sub.save
            redirect_to user_url(params[:user_id])
        else 
            flash[:errors] = @sub.errors.full_messages
            redirect_to user_url(params[:user_id])
        end 

    end 

    def show
        @sub = Sub.find(params[:id])
        # LIST POSTS
        # @sub = current_user.subs.find(params[:id])
        render :show
    end 

    def edit
        render :edit
    end 

    def update
        @sub = Sub.find(params[:id])
        @sub.update(user_params)

        if @sub.save
            redirect_to user_url(params[:user_id])
        else 
            flash[:errors] = @sub.errors.full_messages
            redirect_to user_url(params[:user_id])
        end 
    end 

    private

    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end 


end 