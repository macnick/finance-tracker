class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end

  def under_stock_limit?
    (user_stocks.count < 10)
  end

  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end
end
