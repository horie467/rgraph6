# ** Form generated from reading ui file 'graphwindow4.ui'
# **
# ** Created: 土 9月 21 11:00:55 2019
# **      by: Qt User Interface Compiler version 4.8.7
# **
# ** WARNING! All changes made in this file will be lost when recompiling ui file!

class Ui_GraphWindowBase
  attr_reader :gridLayout, :graph, :pb_close, :spacerItem

  def setupUi(graphWindowBase,panelWindowBase)
    graphWindowBase.set_object_name('graphWindowBase')  if graphWindowBase.object_name.nil?
    graphWindowBase.resize(490, 428)
    @gridLayout = QGridLayout.new(graphWindowBase)
    @gridLayout.set_spacing(6) #= 6
    @gridLayout.set_contents_margins(9,9,9,9) #margin = 9
    @gridLayout.set_object_name('gridLayout')
    @graph = QLabel.new(graphWindowBase)
    @graph.set_object_name('graph')

    @gridLayout.add_widget(@graph, 0, 0, 1, 2)

    @pb_close = QPushButton.new("Close",graphWindowBase)
    @pb_close.set_object_name('pb_close')

    @gridLayout.add_widget(@pb_close, 1, 1, 1, 1)

    @spacerItem = QSpacerItem.new(341, 20, QSizePolicy::Expanding, QSizePolicy::Minimum)

    @gridLayout.add_item(@spacerItem, 1, 0, 1, 1)

    retranslateUi(graphWindowBase)
    #Qt::Object.connect(@pb_close, SIGNAL('clicked()'), graphWindowBase, SLOT('close()'))
    #@pb_close.clicked.connect(graphWindowBase, :close)
    @pb_close.clicked.connect(panelWindowBase, :close_program)

    #Qt::MetaObject.connectSlotsByName(graphWindowBase)
  end # setupUi

  def setup_ui(graphWindowBase)
    setupUi(graphWindowBase)
  end

  def retranslateUi(graphWindowBase)
    graphWindowBase.set_window_title('Graph Window')
    #QApplication.translate('GraphWindowBase', 'Graph Window', nil,
    #                                                       QApplication::UnicodeUTF8)
    @graph.set_text("") # = "" #QApplication.translate('GraphWindowBase', 'TextLabel', nil, QApplication::UnicodeUTF8)
    @pb_close.set_text("Close")  #QApplication.translate('GraphWindowBase', 'Close', nil, QApplication::UnicodeUTF8)
  end # retranslateUi

  def retranslate_ui(graphWindowBase)
    retranslateUi(graphWindowBase)
  end
end

module Ui
  class GraphWindowBase < Ui_GraphWindowBase
  end
end  # module Ui
