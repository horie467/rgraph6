# frozen_string_literal: true
# for ruby-qt6 (Qt 6.11.2)

require_relative 'ui_graphwindow6.rb'
include Math

class GraphData
  attr_accessor :xmin, :xmax, :ymin, :ymax, :func_y
  def initialize
    @xmin = -1
    @xmax = 1
    @ymin = -1
    @ymax = 1
    @func_y = 'sin(x)'
  end
end

class GraphWindow < RubyQt6::Bando::QWidget
  attr_accessor :setup, :frame_margin_x, :frame_margin_y
  def initialize
    super()
    @ui = Ui::GraphWindowBase.new
    @ui.setupUi(self)
    #@graphWindowWidget = w
    #@panelWindowWidget = p
    @gdata = nil #gdata
    # @graphWindowWidget.resize(400,400)
    @ui.graph.resize(400, 400)
    @painter = QPainter.new(@ui.graph)

    @setup = false
    @frame_margin_x = 10
    @frame_margin_y = 10
    @margin_x = 50
    @margin_left = 50
    @margin_y = 50
    @graph_res = 1000
    @logical_w = @graph_res + (@margin_x * 2) + @margin_left
    @logical_h = @graph_res + (@margin_y * 2)

  end

  def resize_event(_e)
    @ui.graph.set_geometry(@frame_margin_x, @frame_margin_y, width - (@frame_margin_x * 2), height - 70)
    draw if setup
  end

  def resize_graph
    @ui.graph.set_geometry(@frame_margin_x, @frame_margin_y, width - (@frame_margin_x * 2), height - 70)
    draw if setup
  end

  def clear
    @pixmap = QPixmap.new(@ui.graph.size)
    @pixmap.fill
    @ui.graph.set_pixmap(@pixmap)
  end

  def draw
    @setup = false
    @pixmap = QPixmap.new(@ui.graph.size)
    @pixmap.fill
    drawGraph
    drawAxis
    @setup = true
    @ui.graph.set_pixmap(@pixmap)
    show
  end

  def set_graph_data(gdata)
    @graph_data = gdata
  end

  def trX(x)
    ((x - @graph_data.xmin) / (@graph_data.xmax - @graph_data.xmin) * @graph_res.to_f + @margin_x + @margin_left).to_i
  end

  def trY(y)
    y = @graph_data.ymax > y ? y : @graph_data.ymax
    y = @graph_data.ymin < y ? y : @graph_data.ymin
    ((@graph_data.ymax - y) / (@graph_data.ymax - @graph_data.ymin) * @graph_res.to_f + @margin_y).to_i
  end

  def drawGraph
    @painter.begin(@pixmap)
    @painter.set_pen(QColor.new())
    @painter.set_window(0, 0, @logical_w, @logical_h)
    @painter.draw_line(trX(@graph_data.xmin), trY(0), trX(@graph_data.xmax), trY(0))
    @painter.draw_line(trX(0), trY(@graph_data.ymin), trX(0), trY(@graph_data.ymax))
    x = @graph_data.xmin
    y = eval(@graph_data.func_y)
    delta = (@graph_data.xmax - @graph_data.xmin) / @graph_res.to_f
    while x < @graph_data.xmax
      xold = x
      yold = y
      x += delta
      y = eval(@graph_data.func_y)

      @painter.draw_line(trX(xold), trY(yold), trX(x), trY(y))
    end
    @painter.end
  end

  def drawAxis
    @painter.begin(@pixmap)
    @painter.set_pen(QColor.new())
    @painter.set_window(0, 0, @logical_w, @logical_h)
    @painter.draw_rect(trX(@graph_data.xmin), trY(@graph_data.ymax), trX(@graph_data.xmax) - trX(@graph_data.xmin), trY(@graph_data.ymin) - trY(@graph_data.ymax))
    x_interval = (@graph_data.xmax - @graph_data.xmin) / 10.0
    y_interval = (@graph_data.ymax - @graph_data.ymin) / 10.0
    x_mark = 20 # / @logical_w * @Graph.width
    y_mark = 20 # / @logical_h * @Graph.height
    qfont = QFont.new('Helvetica')
    qfont.set_pixel_size(30)
    @painter.set_font(qfont)
    (1..9).each do |i|
      x = i * x_interval + @graph_data.xmin
      y = i * y_interval + @graph_data.ymin
      @painter.draw_line(trX(x), trY(@graph_data.ymin), trX(x), (trY(@graph_data.ymin) - y_mark))
      @painter.draw_text((trX(x) - x_mark).to_i, (trY(@graph_data.ymin) + y_mark * 2).to_i, format('%#.02g', x))
      @painter.draw_line(trX(@graph_data.xmin), trY(y), (trX(@graph_data.xmin) + x_mark), trY(y))
      @painter.draw_text((trX(@graph_data.xmin) - x_mark * 4).to_i, trY(y).to_i, format('%#.02g', y))
    end
    @painter.end
  end
  def setPanelWindow(pwin)
    @pwin = pwin
  end

end
