
jQuery ->
  $.getJSON document.location, (data) ->
    render_stat_chart data
    populateTable data["data"]



  
