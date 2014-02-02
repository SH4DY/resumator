class WelcomeController < ApplicationController
  skip_before_action :authorize
  def index
     @area = Area.new
     @users = User.all
  end
end
