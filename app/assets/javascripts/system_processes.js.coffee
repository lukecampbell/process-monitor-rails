# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
#
jQuery ->
  Morris.Line
    element: 'process_chart'
    data: $('#process_chart').data('stats')
    xkey: 'created_at'
    ykeys: ['rss']
    labels: ['RSS']
