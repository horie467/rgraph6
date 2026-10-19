#!/usr/bin/env ruby
# frozen_string_literal: true
# for ruby-qt6 (Qt 6.11.2)
$LOAD_PATH.unshift File.dirname(__FILE__)

require 'qt6/all'
require_relative 'graphpanel6.rb'
require_relative 'graphwindow6.rb'

a = QApplication.new #(ARGV)
gw = GraphWindow.new
gp = GraphPanel.new
gp.setGraphWindow(gw)

gw.show
gp.show

a.exec
