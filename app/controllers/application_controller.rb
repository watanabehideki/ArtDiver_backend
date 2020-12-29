class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token　#Railsが認証トークンを使用しないようにスキップする

    helper_method :login!, :current_user

    def login!
        session[:user_id] = @user.id #セッションを使ってユーザーをログイン
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]　#ログイン中のユーザーを取得するインスタンス変数を定義
    end
end
