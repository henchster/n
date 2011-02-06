class HomeController < ApplicationController

  def index
  end

  def about
    render('about')
  end

  def contactus
    render('contact')
  end

end
