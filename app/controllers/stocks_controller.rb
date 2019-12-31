class StocksController < ApplicationController
  
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You didn't enter any symbol  "
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "This stock symbol does not exist  " unless @stock
    end
    render partial: 'users/result'
  end
end


# respond_to do |format|
#   format.js { render partial: 'users/result' }
# end