class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def about
  end

  def portfolio
  end

  def offer
  end

  def blog
  end

  def contact
  end

end
