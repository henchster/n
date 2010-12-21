class MiohomeController < ApplicationController
  
  def index
  end

def mld
    @line = params[:lines].to_i
    @pp1 = params[:pp1]
    @pp2 = params[:pp2]
    @pp3 = params[:pp3]
    @pp4 = params[:pp4]
    @pp5 = params[:pp5]

    case @line
    when 1
      @linedis = 15
      @pp2 = 0
      @pp3 = 0
      @pp4 = 0
      @pp5 = 0
    when 2
      @linedis = 20
      @pp3 = 0
      @pp4 = 0
      @pp5 = 0
    when 3
      @linedis = 25
      @pp4 = 0
      @pp5 = 0
    when 4
      @linedis = 30
      @pp5 = 0
    when 5
      @linedis = 30
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

    case @pp5
    when "iOne Plus"
      @ppsf5 = 25.68
    when "iTwo Value"
      @ppsf5 = 48.15
    when "iTwo Plus"
      @ppsf5 = 82.93
    when "iThree Plus"
      @ppsf5 = 192.60
    when "Flexi Lite"
      @ppsf5 = 39.00
    when "Flexi"
      @ppsf5 = 45.00
    when "Flexi Plus"
      @ppsf5 = 95.00
    else
      @ppsf5 = 0
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
    @pps5 = @ppsf5/100*@linedis
    @ppad5 = @ppsf5 - @pps5

    @ttsf = @ppsf1+@ppsf2+@ppsf3+@ppsf4+@ppsf5
    @ttad = @ppad1+@ppad2+@ppad3+@ppad4+@ppad5
    @tts = @pps1+@pps2+@pps3+@pps4+@pps5
    render 'index'
  end
end
