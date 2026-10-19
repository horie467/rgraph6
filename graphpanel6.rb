# frozen_string_literal: true
# for ruby-qt6 (Qt 6.11.2)

require_relative 'ui_graphpanel6.rb'

class GraphPanel < RubyQt6::Bando::QWidget
  q_object do
    slot 'draw_graph()'
    slot 'close_program()'
  end

  def initialize(parent=nil)
    super()
    @ui = Ui::GraphPanelBase.new
    @ui.setupUi(self)

    @graph_data = GraphData.new

    @ui.xmax.set_text(@graph_data.xmax.to_s)
    @ui.xmin.set_text(@graph_data.xmin.to_s)
    @ui.ymax.set_text(@graph_data.ymax.to_s)
    @ui.ymin.set_text(@graph_data.ymin.to_s)
    @ui.le_func.set_text(@graph_data.func_y.to_s)

    @ui.pb_draw.clicked.connect(self,:draw_graph)

  end

  def draw_graph
    puts 'draw_graph called'
    @graphPanel.draw_graph
  end

  def setGraphWindow(gwin)
    @gwin = gwin
    @gwin.clear
  end

  def draw_graph
    @gwin.show
    puts 'draw_graph in GraphPanel called'
    get_parameters
    @gwin.set_graph_data(@graph_data)
    @gwin.draw
    # @graphPanelWidget.show
    @gwin.setup = true
  end

  def get_parameters
    @graph_data.xmax = @ui.xmax.text.to_str.to_f
    @graph_data.xmin = @ui.xmin.text.to_str.to_f
    @graph_data.ymax = @ui.ymax.text.to_str.to_f
    @graph_data.ymin = @ui.ymin.text.to_str.to_f
    @graph_data.func_y = @ui.le_func.text.to_str
  end

  def get_graph_data
    @graph_data
  end

  def close_event(e)
    if confirmExit
      @gwin.close
      e.accept
    else
      e.ignore
    end
  end
  def confirmExit
    ret = 0
    ret = QMessageBox.warning(
      self,
      'Close Windows?',
      'Close all windows ?',
      QMessageBox::Yes,
      QMessageBox::No
    )
    ret != QMessageBox::No
  end
  def close_program
    if confirmExit
      @gwin.close
      self.close
      #e.accept
    else
      #e.ignore
    end
  end

end
