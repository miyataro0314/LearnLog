class SessionsController < ApplicationController

    def new
        #ログインページ遷移用
        @user = User.new
    end
    
    # login_path
    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            flash[:notice] = "ログインしました"
            redirect_to("/")
        else
            flash.now[:alert] = "ログインに失敗しました"
            render "new", status: 422
        end

    end

    # logout_path
    def destroy
        log_out()
        flash[:notice] = "ログアウトしました"
        redirect_to("/")
    end

end