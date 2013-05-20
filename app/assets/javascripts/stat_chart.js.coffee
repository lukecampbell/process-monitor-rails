# For rendering morris
#
@initializeChart = (data) ->
  @morris = Morris.Line
    element: 'process_chart'
    data: data
    xkey: 'created_at'
    ykeys: [$('#process_chart').attr('label')]
    labels: ['Value']

@updateChart = (data) ->
  morris.setData data
