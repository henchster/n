include ActionView::Helpers::NumberHelper

class MioplanController < ApplicationController

MioPlan6 = Struct.new(:generalname, :mobileplanname, :monthlyfee, :bundle, :snbb, :del)
$siop = MioPlan6.new("6Mbps mio Plan", "iOne Plus", 63.38, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sfl = MioPlan6.new("6Mbps mio Plan", "Flexi Lite", 75.57, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sitv = MioPlan6.new("6Mbps mio Plan", "iTwo Value", 81.98, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sfv = MioPlan6.new("6Mbps mio Plan", "Flexi Value", 87.46, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sitp = MioPlan6.new("6Mbps mio Plan", "iTwo Plus", 106.32, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sfp = MioPlan6.new("6Mbps mio Plan", "Flexi Plus", 114.77, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sithp = MioPlan6.new("6Mbps mio Plan", "iThree Plus", 192.67, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")
$sfpr = MioPlan6.new("6Mbps mio Plan", "Flexi Premium", 201.96, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "6Mbps Unlimited", "mio Voice")

MioPlan10 = Struct.new(:generalname, :mobileplanname, :monthlyfee, :bundle, :snbb, :del)
$tiop = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 68.98, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$tfl = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 81.17, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$titv = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 87.58, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$tfv = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 93.06, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$titp = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 111.92, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$tfp = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 120.38, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$tithp = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 198.27, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")
$tfpr = MioPlan10.new("10Mbps mio Plan", "iOne Plus", 207.56, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "10Mbps Unlimited", "mio Voice")

MioPlan15 = Struct.new(:generalname, :mobileplanname, :monthlyfee, :bundle, :snbb, :del)
$fiop = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 79.78, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$ffl = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 91.57, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$fitv = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 97.98, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$ffv = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 103.46, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$fitp = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 122.32, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$ffp = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 130.76, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$fithp = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 208.67, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")
$ffpr = MioPlan15.new("15Mbps mio Plan", "iOne Plus", 217.96, "100mins out going, Free incoming voice calls, 500 local sms and Caller-ID", "15Mbps Unlimited", "mio Voice")

  def index
    @mpp1 = ['iOne Plus', 'iTwo Value', 'iTwo Plus', 'iThree Plus', 'Flexi Lite', 'Flexi', 'Flexi Plus']
  end

  def mld
    @line = params[:lines].to_i
    @pp1 = params[:pp1]
    @pp2 = params[:pp2]
    @pp3 = params[:pp3]
    @pp4 = params[:pp4]

    case @line
    when 2
      @linedis = 15
      @pp2 = 0
      @pp3 = 0
      @pp4 = 0
      @pp5 = 0
    when 3
      @linedis = 20
      @pp3 = 0
      @pp4 = 0
      @pp5 = 0
    when 4
      @linedis = 25
      @pp4 = 0
      @pp5 = 0
    when 5
      @linedis = 30
      @pp5 = 0
    else
      @liner = "You Failed"
    end
    pplogic
  end

  def pplogic

    case @pp1
    when "iOne Plus"
      @ppsf1 = 25.68
    when "iTwo Value"
      @ppsf1 = 48.15
    when "iTwo Plus"
      @ppsf1 = 82.93
    when "iThree Plus"
      @ppsf1 = 192.60
    when "Flexi Lite"
      @ppsf1 = 39.00
    when "Flexi"
      @ppsf1 = 45.00
    when "Flexi Plus"
      @ppsf1 = 95.00
    else
      @ppsf1 = 0
    end

    case @pp2
    when "iOne Plus"
      @ppsf2 = 25.68
    when "iTwo Value"
      @ppsf2 = 48.15
    when "iTwo Plus"
      @ppsf2 = 82.93
    when "iThree Plus"
      @ppsf2 = 192.60
    when "Flexi Lite"
      @ppsf2 = 39.00
    when "Flexi"
      @ppsf2 = 45.00
    when "Flexi Plus"
      @ppsf2 = 95.00
    else
      @ppsf2 = 0
    end

    case @pp3
    when "iOne Plus"
      @ppsf3 = 25.68
    when "iTwo Value"
      @ppsf3 = 48.15
    when "iTwo Plus"
      @ppsf3 = 82.93
    when "iThree Plus"
      @ppsf3 = 192.60
    when "Flexi Lite"
      @ppsf3 = 39.00
    when "Flexi"
      @ppsf3 = 45.00
    when "Flexi Plus"
      @ppsf3 = 95.00
    else
      @ppsf3 = 0
    end

    case @pp4
    when "iOne Plus"
      @ppsf4 = 25.68
    when "iTwo Value"
      @ppsf4 = 48.15
    when "iTwo Plus"
      @ppsf4 = 82.93
    when "iThree Plus"
      @ppsf4 = 192.60
    when "Flexi Lite"
      @ppsf4 = 39.00
    when "Flexi"
      @ppsf4 = 45.00
    when "Flexi Plus"
      @ppsf4 = 95.00
    else
      @ppsf4 = 0
    end
    mldlogic
  end

  def mldlogic
    @pps1 = @ppsf1/100*@linedis
    @ppad1 = @ppsf1 - @pps1
    @pps2 = @ppsf2/100*@linedis
    @ppad2 = @ppsf2 - @pps2
    @pps3 = @ppsf3/100*@linedis
    @ppad3 = @ppsf3 - @pps3
    @pps4 = @ppsf4/100*@linedis
    @ppad4 = @ppsf4 - @pps4


    @ttsf = @ppsf1+@ppsf2+@ppsf3+@ppsf4
    @ttad = @ppad1+@ppad2+@ppad3+@ppad4
    @tts = @pps1+@pps2+@pps3+@pps4
    render 'index'
  end

  def result
    @pp01 = params[:pp01]
    @bb = params[:bb]
    @fline = params[:fline]

    case @pp01
    when "iOne Plus"
      @ppsf01 = 25.68
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $siop
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $tiop
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $fiop
      end
    when "iTwo Value"
      @ppsf01 = 48.15
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sitv
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $titv
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $fitv
    end
    when "iTwo Plus"
      @ppsf01 = 82.93
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sitp
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $titp
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $fitp
      end
    when "iThree Plus"
      @ppsf01 = 192.60
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sithp
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $tithp
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $fithp
      end
    when "Flexi Lite"
      @ppsf01 = 39.00
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sfl
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $tfl
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $ffl
      end
    when "Flexi"
      @ppsf01 = 45.00
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sfv
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $tfv
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $ffv
      end
    when "Flexi Plus"
      @ppsf01 = 95.00
      case @bb
      when "6 Mbps"
      @bbsf = 35.91
      @mpr = $sfp
      when "10 Mbps"
      @bbsf = 42.21
      @mpr = $tfp
      when "15 Mbps"
      @bbsf = 59.90
      @mpr = $ffp
      end
    end

    case @fline
    when "Analog"
      @flinesf = 9.81
    when "mio Voice"
      @flinesf = 16.05
    else
      @flinesf = "You Failed"
    end

    @ttsf0 = @ppsf01+@bbsf+@flinesf
    @result = "Save! #{number_to_currency(@ttsf0-@mpr.monthlyfee)} with #{@mpr.generalname}."

    render 'index'
  end

end
