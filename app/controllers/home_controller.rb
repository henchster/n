class HomeController < ApplicationController

  def index
    about
  end

  def about
    render('about')
  end

  def contactus
    render('contact')
  end

end
