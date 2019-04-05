class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private
    def authenticate_user
      client_id = ENV['GITHUB_CLIENT_ID']
      redirect_uri = CGI.escape("http://localhost:3000/auth")
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT_ID']}&scope=repo" if !logged_in?
    end 

    def logged_in?
      !!session[:token]
    end
    
end

