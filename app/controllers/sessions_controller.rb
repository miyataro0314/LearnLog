class SessionsController < ApplicationController

    def new
        #ログインページ遷移用
    end
    
    def create
        #ログイン認証処理用
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            log_in(user)
            flash[:notice] = "ログインしました"
            redirect_to("/")
        else
            flash.now[:alert] = "ログインに失敗しました"
            render "new", status: 422
        end

    end

    def destroy
        #ログアウト処理用
        log_out()
        flash[:notice] = "ログアウトしました"
        redirect_to("/")
    end

end