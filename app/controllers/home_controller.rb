class HomeController < ApplicationController

  def index
    about
	render('about')
  end

  def about
  end

  def contactus
    render('contact')
  end

end
