class User < ApplicationRecord
    validates :name, {presence: true, uniqueness: true}
    validates :password_digest, {presence: true}

    has_secure_password
    #bcryptインストールするにより使用できるメソッド

end
