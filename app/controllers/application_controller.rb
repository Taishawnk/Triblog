class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?
     def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        #meminization istead of quaring the database a bunch of time meminization will make sure that are returning the session object instead of quarying the database
     end 

     def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert]="You must be (LOGGED IN!) to preform that task."
            redirect_to login_path
         end
    end
end
