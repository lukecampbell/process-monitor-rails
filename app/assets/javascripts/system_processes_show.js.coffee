
jQuery ->
  $.getJSON document.location, (data) ->
    data = data["data"]
    initializeChart data
    initializeTable data
  
  refresh = getURLParameter "refresh"
  console.log refresh
  setInterval ->
    $.getJSON document.location, (data) ->
      data = data["data"]
      updateChart data
      updateTable data
  , 1000

    
    



  
