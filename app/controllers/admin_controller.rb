class AdminController < ApplicationController

  def index
    list
    render('list')
  end

  def list
    @mobilephone = Mobiledata.order("mobiledatas.brand ASC")
  end

  def show
    @product = Mobiledata.find(params[:id])
    render(:template => 'store/show')
  end

  def edit
    @mobilephone = Mobiledata.find(params[:id])
  end

  def update
    @mobilephone = Mobiledata.find(params[:id])
    if @mobilephone.update_attributes(params[:mobilephone])
      redirect_to(:action => 'show', :id => @mobilephone.id)
    else
      render('edit')
    end
  end

  def new
    @mobilephone = Mobiledata.new
  end

  def create
    @mobilephone = Mobiledata.new(params[:mobilephone])

    if @mobilephone.save
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end

  def delete
    @mobilephone = Mobiledata.find(params[:id])
  end

  def destroy
    Mobiledata.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end
end
