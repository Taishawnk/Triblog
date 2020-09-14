class SessionsController < ApplicationController

    def new 
    end

    def create 
        
        user = User.find_by(username: params[:session][:username])

        if user  && user.authenticate(params[:session][:password])
            #session instance method
            session[:user_id] = user.id
          
            # https://guides.rubyonrails.org/action_controller_overview.html section 5
            flash[:notice] = "Log in was Successful!" 
            redirect_to user
        else
            flash.now[:alert] = "Your Username or Password was incorrect please try again"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil 
        flash[:notice]  = "You have successfully logged out!"
       redirect_to root_path
    end 

end


#use flash[:notice] for redirects as the message shows up after the redirect has taken place  flash.now[:alert]] on renders happens before 

