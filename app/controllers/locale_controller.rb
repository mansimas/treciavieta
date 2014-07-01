class ArticlesController < ApplicationController
def set
  locale = params[:id]
  raise 'unsupported locale' unless ['lt', 'en'].include?(locale)
  current_user.locale = locale
  current_user.save
  redirect_to :back
end
end
