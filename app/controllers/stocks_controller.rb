class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = "This stock symbol does not exist."
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "You didn't enter any symbol"
      redirect_to my_portfolio_path
    end
  end
end