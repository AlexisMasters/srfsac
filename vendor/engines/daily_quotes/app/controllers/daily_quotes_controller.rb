class DailyQuotesController < ApplicationController

  before_filter :find_all_daily_quotes
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @daily_quote in the line below:
    present(@page)
  end

  def show
    @daily_quote = DailyQuote.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @daily_quote in the line below:
    present(@page)
  end

protected

  def find_all_daily_quotes
    @daily_quotes = DailyQuote.order('month, day')
  end

  def find_page
    @page = Page.where(:link_url => "/daily_quotes").first
  end

end
