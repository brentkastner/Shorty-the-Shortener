class UrlsController < ApplicationController
  def new
    @shortened_url = Url.new
  end

  def create
    @shortened_url = Url.new(url_params)
    if @shortened_url.save
      code = @shortened_url.short_code
      flash[:short_code] = code
      redirect_to new_url_url

    else
      render :action => "new"
    end
  end

  def show
    #@shortened_url = Url.find(params[:id])
    @shortened_url = Url.find_using_short_code!(params[:id])
    redirect_to @shortened_url.url
    @shortened_url.click_counter
  end

  private

  def url_params
    params.require(:url).permit(:url, :short_code)
  end
end
