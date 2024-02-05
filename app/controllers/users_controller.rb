class UsersController < ApplicationController
    
    #get "/users/new" (new_user_path)
    def new
        @user = User.new
    end

    #post "/users"
    def create
        user = User.new(user_params)
        #セキュリティ上、User.new(params[:user])で丸々渡すのはアウト。ストロングパラメータを使用して実装する。
        raise
        user.save
        redirect_to("/")
    end

    private
        def user_params
            params.require(:user).permit(:name, :password_digest)
        end

end
