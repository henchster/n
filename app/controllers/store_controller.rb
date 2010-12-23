class StoreController < ApplicationController

  def index
    @productlists = Mobiledata.where(:quantity => 1..100)
  end

  def show
    @product = Mobiledata.find(params[:id])
  end

  def apple
    @productlists = Mobiledata.where(:brand => 'Apple', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def blackberry
    @productlists = Mobiledata.where(:brand => 'Blackberry', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def htc
    @productlists = Mobiledata.where(:brand => 'HTC', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def lg
    @productlists = Mobiledata.where(:brand => 'LG', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def motorola
    @productlists = Mobiledata.where(:brand => 'Motoraola', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def nokia
    @productlists = Mobiledata.where(:brand => 'Nokia', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def samsung
    @productlists = Mobiledata.where(:brand => 'Samsung', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def sonyericsson
    @productlists = Mobiledata.where(:brand => 'Sony Ericssion', :quantity => 1..10)
    render(:template => 'store/index')
  end

  def free
    @productlists = Mobiledata.where(:quantity => 1..100, :iop => 0)
    render(:template => 'store/index')
  end

  def noncam
    @productlists = Mobiledata.where(:quantity => 1..100, :camera => 0)
    render(:template => 'store/index')
  end
end
