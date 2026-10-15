# ** Form generated from reading ui file 'graphpanel4.ui'
# **
# ** Created: 土 9月 21 11:00:53 2019
# **      by: Qt User Interface Compiler version 4.8.7
# **
# ** WARNING! All changes made in this file will be lost when recompiling ui file!

class Ui_GraphPanelBase
  attr_reader :gridLayout, :textLabel1, :ymax, :ymin, :xmin, :xmax, :pb_draw, :textLabel3, :pb_close, :textLabel2,
              :le_func

  def setupUi(graphPanelBase)
    graphPanelBase.object_name = 'graphPanelBase' if graphPanelBase.object_name.nil?
    graphPanelBase.resize(360, 166)
    @gridLayout = QGridLayout.new(graphPanelBase)
    #@gridLayout.spacing = 6
    #@gridLayout.margin = 9
    @gridLayout.set_spacing(6) #= 6
    @gridLayout.set_contents_margins(9,9,9,9) #margin = 9

    #@gridLayout.object_name = 'gridLayout'
    @gridLayout.set_object_name('gridLayout')
    @textLabel1 = QLabel.new(graphPanelBase)
    #@textLabel1.object_name = 'textLabel1'

    @gridLayout.add_widget(@textLabel1, 0, 0, 1, 1)

    @ymax = QLineEdit.new(graphPanelBase)
    @ymax.set_object_name 'ymax'

    @gridLayout.add_widget(@ymax, 2, 2, 1, 1)

    @ymin = QLineEdit.new(graphPanelBase)
    @ymin.set_object_name('ymin')

    @gridLayout.add_widget(@ymin, 2, 1, 1, 1)

    @xmin = QLineEdit.new(graphPanelBase)
    @xmin.set_object_name('xmin')

    @gridLayout.add_widget(@xmin, 1, 1, 1, 1)

    @xmax = QLineEdit.new(graphPanelBase)
    @xmax.set_object_name('xmax')

    @gridLayout.add_widget(@xmax, 1, 2, 1, 1)

    @pb_draw = QPushButton.new(graphPanelBase)
    @pb_draw.set_object_name('pb_draw')

    @gridLayout.add_widget(@pb_draw, 3, 0, 1, 2)

    @textLabel3 = QLabel.new(graphPanelBase)
    @textLabel3.set_object_name('textLabel3')

    @gridLayout.add_widget(@textLabel3, 2, 0, 1, 1)

    @pb_close = QPushButton.new(graphPanelBase)
    @pb_close.set_object_name('pb_close')

    @gridLayout.add_widget(@pb_close, 3, 2, 1, 1)

    @textLabel2 = QLabel.new(graphPanelBase)
    @textLabel2.set_object_name('textLabel2')

    @gridLayout.add_widget(@textLabel2, 1, 0, 1, 1)

    @le_func = QLineEdit.new(graphPanelBase)
    @le_func.set_object_name('le_func')

    @gridLayout.add_widget(@le_func, 0, 1, 1, 2)

    retranslateUi(graphPanelBase)
    #Qt::Object.connect(@pb_close, SIGNAL('clicked()'), graphPanelBase, SLOT('close()'))
    #@pb_close.clicked.connect(graphPanelBase,:close)
    @pb_close.clicked.connect(graphPanelBase,:close_program)

    #Qt::MetaObject.connectSlotsByName(graphPanelBase)
  end # setupUi

  def setup_ui(graphPanelBase)
    setupUi(graphPanelBase)
  end

  def retranslateUi(graphPanelBase)
    #graphPanelBase.windowTitle = 'Graph Settings' #QApplication.translate('GraphPanelBase', 'Graph Settings', nil,
    graphPanelBase.set_window_title('Graph Settings') #QApplication.translate('GraphPanelBase', 'Graph Settings', nil,

    #QApplication::UnicodeUTF8)

    @textLabel1.set_text("y=")  #Qt::Application.translate('GraphPanelBase', 'y=', nil, Qt::Application::UnicodeUTF8)
    @pb_draw.set_text("Draw") #QApplication.translate('GraphPanelBase', 'Draw', nil, QApplication::UnicodeUTF8)
    @textLabel3.set_text("Y range:") #QApplication.translate('GraphPanelBase', 'Y range:', nil, QApplication::UnicodeUTF8)
    @pb_close.set_text("Close") #QApplication.translate('GraphPanelBase', 'Close', nil, QApplication::UnicodeUTF8)
    @textLabel2.set_text("X range:") #QApplication.translate('GraphPanelBase', 'X range:', nil, QApplication::UnicodeUTF8)
  end # retranslateUi

  def retranslate_ui(graphPanelBase)
    retranslateUi(graphPanelBase)
  end
end

module Ui
  class GraphPanelBase < Ui_GraphPanelBase
  end
end  # module Ui
