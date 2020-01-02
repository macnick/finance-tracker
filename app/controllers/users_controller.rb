class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = @user.stocks
  end
end