class MySketch < Processing::App
  def setup
    @originX = 400
    @originY = 400
    @radius = 100
    @blockLength = 10
    @blockWidth = 50
    @angle = @blockLength / (@radius + @blockWidth).to_f

    @initialAngleDeg = -30
    @initialAngle = radians @initialAngleDeg 
    stroke_weight 2
  end

  def draw
    total_angle = 0

    
    i = 0
    until total_angle > 2*PI do
      
      ax = @radius * cos(total_angle - @initialAngle) + @originX
      ay = @radius * sin(total_angle - @initialAngle) + @originY 

      farther = @radius + @blockWidth
      bx = farther * cos(total_angle - @initialAngle) + @originX
      by = farther * sin(total_angle - @initialAngle) + @originY 
      
      no_fill

      line ax, ay, bx, by


      total_angle += @angle
      
      dx = @radius * cos(total_angle - @initialAngle) + @originX
      dy = @radius * sin(total_angle - @initialAngle) + @originY 

      farther = @radius + @blockWidth
      
      if i.even? 
        cx = farther * cos(total_angle - @initialAngle) + @originX
        cy = farther * sin(total_angle - @initialAngle) + @originY 

        line ax, ay, dx, dy
        line bx, by, cx, cy
      end

      i+= 1
    end
  end

end

MySketch.new :title => "Circles", :width => 800, :height => 600
