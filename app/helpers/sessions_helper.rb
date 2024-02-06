module SessionsHelper
    #渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end
    
    #現在のユーザーをログアウトする
    def log_out
        session.delete(:user_id)
    end
end
