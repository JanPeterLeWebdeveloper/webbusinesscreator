class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about portfolio services blog contact]
  # before_filter :authenticate_user!, only: %i[dashboard messages courses]
  # rails devise if user logged in show only pages
  def home
    @tests = policy_scope(Test).last(3)
    @projects = policy_scope(Project).last(3)
    @disable_sidebar = true
  end

  def about
  end

  def portfolio
  end

  def services
  end

  def blog
  end

  def contact
  end

end

