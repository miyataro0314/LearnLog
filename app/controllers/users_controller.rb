class UsersController < ApplicationController
    
    #get "/users/new" (new_user_path)
    def new
        @user = User.new
    end

    #post "/users"
    def create
        @user = User.new(user_params)
        #セキュリティ上、User.new(params[:user])で丸々渡すのはアウト。ストロングパラメータを使用して実装する。
        if params[:user][:password] == params[:user][:password_confirmation]
            if @user.save
                flash[:notice] = "登録に成功しました"
                redirect_to("/") #仮URL
            else
                flash.now[:alert] = "登録に失敗しました"
                render "new", status: 422
            end
        else
            flash.now[:alert] = "パスワードが一致しません"
            render "new", status: 422
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
