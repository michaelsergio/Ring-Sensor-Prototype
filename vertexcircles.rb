# Use: rp5 watch vertixcircles.rb
class MySketch < Processing::App
  def setup
    @originX = 400
    @originY = 400
    @radius = 50
    @blockLength = 10
    @blockWidth = 20
    @angle = @blockLength / (@radius + @blockWidth).to_f

    @initialAngleDeg = 45
    @initialAngle = radians @initialAngleDeg 
    stroke_weight 2
  end

  def draw
    total_angle = 0

    
    i = 0
    until total_angle > 2*PI - @angle do

      ax = @radius * cos(total_angle - @initialAngle) + @originX
      ay = @radius * sin(total_angle - @initialAngle) + @originY 

      farther = @radius + @blockWidth
      bx = farther * cos(total_angle - @initialAngle) + @originX
      by = farther * sin(total_angle - @initialAngle) + @originY 
      
      total_angle += @angle
      
      dx = @radius * cos(total_angle - @initialAngle) + @originX
      dy = @radius * sin(total_angle - @initialAngle) + @originY 

      farther = @radius + @blockWidth
      cx = farther * cos(total_angle - @initialAngle) + @originX
      cy = farther * sin(total_angle - @initialAngle) + @originY 
      
      if i.even? 
        if i <= 12
        color_mode Processing::PConstants::HSB
        val = 255 - 2*i
        fill 0, 255, 255, 255
        else 
          no_fill
        end
        begin_shape
        vertex ax,ay
        vertex bx,by
        vertex cx,cy
        vertex dx,dy
        vertex ax,ay
        end_shape
      end

      i+= 1
    end
  end

end

MySketch.new :title => "Circles", :width => 800, :height => 600
