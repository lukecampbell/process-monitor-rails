# For rendering morris
#
@render_stat_chart = (data) ->
  morris = Morris.Line
    element: 'process_chart'
    data: data["data"]
    xkey: 'created_at'
    ykeys: [$('#process_chart').attr('label')]
    labels: ['Value']
    setInterval ->
      $.getJSON document.location, (data) ->
        morris.setData data["data"]
    , 1000
