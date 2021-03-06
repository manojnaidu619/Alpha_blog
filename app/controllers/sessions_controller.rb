class SessionsController < ApplicationController

 def new

 end

 def create
   @user = User.find_by(email: params["session"]["email"])
   if @user && @user.authenticate(params["session"]["password"])
      session[:user_id] = @user.id
      flash.now[:notice] = "You are successfully logged in"
      redirect_to user_path(@user)
   else
      flash.now[:notice] = "Something went wrong,Please try again!!!"
      render 'new'
   end
 end

 def destroy
    session[:user_id] = nil
    redirect_to root_path
 end


end
