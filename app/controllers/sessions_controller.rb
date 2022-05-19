class SessionsController < ApplicationController
    def index
    end

    def create
        @user = User.find_by({"email" => params["email"]})
        if @user
            if BCrypt::Password.new(@user["password"]) == params["password"]
                session["user_id"] = @user["id"]

                flash["notice"] = "Welcome."
                redirect_to "/companies"
            else 
                flash["notice"] = "Nah..."
                redirect_to "/sessions/new"
            end
        else
            flash["notice"] = "Nah..."
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session["user_id"] = nil
        flash["notice"] = "Byeeee"
        redirect_to "/sessions/new"
    end
end
