include ActionView::Helpers::NumberHelper
class MobileController < ApplicationController
  
MobilePricePlan = Struct.new(:priceplanname, :monthlyfee, :localcalls, :localsms, :localdata, :minmins, :maxmins)
$iosv = MobilePricePlan.new("iOne Super Value", 15.00, 80, 50, 0, 1, 146)
$iop = MobilePricePlan.new("iOne Plus", 25.68, 100, 500, 0, 147, 240)
$itv = MobilePricePlan.new("iTwo Value", 48.15, 300, 500, 0, 241, 516)
$itp = MobilePricePlan.new("iTwo Plus", 82.93, 700, 500, 0, 517, 1383)
$ithp = MobilePricePlan.new("iThree Plus", 192.60, 2000, 2000, 0,1384, 99999999)
$fl = MobilePricePlan.new("Flexi Lite", 39.00, 100, 500, 12288, 1, 205)
$fv = MobilePricePlan.new("Flexi Value", 56.00, 200, 500, 12288, 206, 443)
$fp = MobilePricePlan.new("Flexi Plus", 95.00, 500, 500, 12288, 444, 1185)
$fpr = MobilePricePlan.new("Flexi Premium", 205.00, 2000, 2000, 30720, 1186, 99999999)

BbomVASPlan = Struct.new(:vasname, :monthlyfee, :promo1, :promo2, :localdata, :mindata, :maxdata)
$d200 = BbomVASPlan.new("Deluxe VAS", 9.90, 7.29, 5.90, 200, 1, 200)
$p1 = BbomVASPlan.new("Plus VAS", 19.90, 15.92, 8.96, 1024, 201, 1024)
$p10 = BbomVASPlan.new("Premium VAS", 29.90, 23.92, 13.45, 10240, 1025, 10240)
$p30 = BbomVASPlan.new("Platinum VAS", 39.90, 31.92, 17.95, 30720, 10241, 999999)
$dummy12 = BbomVASPlan.new("", 0, 0, 0, 0,10241,12288)

  def index
  end

  def result
    @talktime = params[:talktime].to_i
    @data = params[:data].to_i
    @subfee = params[:subfee].to_i

    usagelogic
  end

  def usagelogic
    if @talktime.nil? || @talktime == 0
      @talktimenil = 0
    else
      @talktimenil = 1
    end
    if @data.nil? || @data == 0
      @datanil = 0
    else
      @datanil = 1
    end
    if @subfee.nil? || @subfee == 0
      @subfeenil = 0
    else
      @subfeenil = 1
    end
    recologic
  end

    def talktimelogic
    case @talktime
    when $iosv.minmins..$iosv.maxmins
      @talktimer = $iosv
    when $iop.minmins..$iop.maxmins
      @talktimer = $iop
    when $itv.minmins..$itv.maxmins
      @talktimer = $itv
    when $itp.minmins..$itp.maxmins
      @talktimer = $itp
    when $ithp.minmins..$ithp.maxmins
      @talktimer = $ithp
    else
      "Invalid talktime"
    end
  end

  def flexilogic
    case @data
    when $dummy12.mindata..$dummy12.maxdata
      @flexi = 1
      case @talktime
      when $fl.minmins..$fl.maxmins
        @datarflexi = $fl
      when $fv.minmins..$fv.maxmins
        @datarflexi = $fv
      when $fp.minmins..$fp.maxmins
        @datarflexi = $fp
      when$fpr.minmins..$fpr.maxmins
        @datarflexi = $fpr
      end
    else
      datalogic
    end
   end

  def datalogic
    case @data
    when $d200.mindata..$d200.maxdata
      talktimelogic
      @datar = $d200
    when $p1.mindata..$p1.maxdata
      talktimelogic
      @datar = $p1
    when $p10.mindata..$p10.maxdata
      talktimelogic
      @datar = $p10
    when $p30.mindata..$p30.maxdata
      talktimelogic
      @datar = $p30
    else
      "Invalid Data"
    end
  end

  def recologic
   if @talktimenil == 0 && @datanil == 0 && @subfeenil == 0
      @result = "Please enter your usage!"
    elsif @talktimenil == 1 && @datanil == 0 && @subfeenil == 0
      talktimelogic
      @result = "The best plan for you is #{@talktimer.priceplanname} with #{@talktimer.localcalls}mins of local calls, #{@talktimer.localsms} local SMS and monthly fee of #{number_to_currency(@talktimer.monthlyfee)}."
    elsif @talktimenil == 0 && @datanil ==1 && @subfeenil == 0
      datalogic
      @result = "The best plan for you is #{@datar.vasname} with #{@datar.localdata}mb of local data and monthly fee of #{number_to_currency(@datar.promo2)}."
    elsif @talktimenil == 0 && @datanil == 0 && @subfeenil == 1
      @result = "Error"
    elsif @talktimenil == 0 && @datanil == 1 && @subfeenil == 1
      datalogic
      if @datar.promo2 >= @subfee
        @result = "You can remain as existing plan!"
      else
        @result = "Save #{number_to_currency(@subfee - @datar.promo2)} monthly! when you change to #{@datar.vasname} with #{@datar.localdata}mb of local data and new monthly fee of only #{number_to_currency(@datar.promo2)}!"
      end
    elsif @talktimenil == 1 && @datanil == 1 && @subfeenil == 1
      flexilogic
      if @flexi == 1
        if @datarflexi.monthlyfee >= @subfee
          @result = "You can remain as existing plan!"
        else
          @result = "Save #{number_to_currency(@subfee - @datarflexi.monthlyfee)} monthly! when you change to #{@datarflexi.priceplanname} with #{@datarflexi.localdata}mb of local data, #{@datarflexi.localcalls}mins of local calls, #{@datarflexi.localsms} local SMS and new monthly fee of only #{number_to_currency(@datarflexi.monthlyfee)}!"
        end
      else
        if (@datar.promo2 + @talktimer.monthlyfee) >= @subfee
          @result = "You can remain as existing plan!"
        elsif (@talktimer.monthlyfee + @datar.promo2) == 39.129999999999995
          @result = "Save #{number_to_currency(@subfee - $fl.monthlyfee)} monthly! when you change to #{$fl.priceplanname} with #{$fl.localdata}mb of local data, #{$fl.localcalls}mins of local calls, #{$fl.localsms} local SMS and new monthly fee of only #{number_to_currency($fl.monthlyfee)}!"
        elsif (@talktimer.monthlyfee + @datar.promo2) == 210.54999999999998
          @result = "Save #{number_to_currency(@subfee - $fpr.monthlyfee)} monthly! when you change to #{$fpr.priceplanname} with #{$fpr.localdata}mb of local data, #{$fpr.localcalls}mins of local calls, #{$fpr.localsms} local SMS and new monthly fee of only #{number_to_currency($fpr.monthlyfee)}!"
        else
          @result = "Save #{number_to_currency(@subfee - (@datar.promo2 + @talktimer.monthlyfee))} monthly! when you change to #{@talktimer.priceplanname} addon #{@datar.vasname} with #{@datar.localdata}mb of local data, #{@talktimer.localcalls}mins of local calls, #{@talktimer.localsms} local SMS and new monthly fee of only #{number_to_currency(@talktimer.monthlyfee + @datar.promo2)}!"
        end
      end
    elsif @talktimenil == 1 && @datanil == 1 && @subfeenil == 0
      flexilogic
      if @flexi == 1
        @result = "The best plan for you is #{@datarflexi.priceplanname} with #{@datarflexi.localdata}mb of local data, #{@datarflexi.localcalls}mins of local calls, #{@datarflexi.localsms} local SMS and monthly fee of only #{number_to_currency(@datarflexi.monthlyfee)}!"
      elsif (@talktimer.monthlyfee + @datar.promo2) == 39.129999999999995
        @result = "The best plan for you is #{$fl.priceplanname} monthly! when you change to #{$fl.priceplanname} with #{$fl.localdata}mb of local data, #{$fl.localcalls}mins of local calls, #{$fl.localsms} local SMS and new monthly fee of only #{number_to_currency($fl.monthlyfee)}!"
      elsif (@talktimer.monthlyfee + @datar.promo2) == 210.54999999999998
        @result = "The best plan for you is #{$fpr.priceplanname} monthly! when you change to #{$fpr.priceplanname} with #{$fpr.localdata}mb of local data, #{$fpr.localcalls}mins of local calls, #{$fpr.localsms} local SMS and new monthly fee of only #{number_to_currency($fpr.monthlyfee)}!"
      else
        @result = "The best plan for you is #{@talktimer.priceplanname} addon #{@datar.vasname} with #{@datar.localdata}mb of local data, #{@talktimer.localcalls}mins of local calls, #{@talktimer.localsms} local SMS and new monthly fee of only #{number_to_currency(@talktimer.monthlyfee + @datar.promo2)}!"
      end
    elsif @talktimenil == 1 && @datanil == 0 && @subfeenil == 1
      talktimelogic
      if @talktimer.monthlyfee >= @subfee
        @result = "You can remain as existing plan"
      else
         @result = "Save #{number_to_currency(@subfee - @talktimer.monthlyfee)} monthly! when you change to #{@talktimer.priceplanname} with #{@talktimer.localcalls}mins local calls, #{@talktimer.localsms} local SMS and monthly fee of #{number_to_currency(@talktimer.monthlyfee)}."
      end
    else
      @result = "You have entered invalid usage."
    end
 render 'index'
  end
end
