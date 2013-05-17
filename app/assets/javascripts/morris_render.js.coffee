# For rendering morris
jQuery ->
  Morris.Line
    element: 'process_chart'
    data: $('#process_chart').data('stats')
    xkey: 'created_at'
    ykeys: ['rss']
    labels: ['RSS']
