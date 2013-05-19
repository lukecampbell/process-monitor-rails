updateTable = (data) ->
  $('#stat_table > tbody').empty()
  $.each data, (i,val) ->
    console.log val 
    s = "<tr><td>" + val["created_at"] + "</td><td>" + val["rss"] + "</td><td>" + val["pmem"] + "</td><td>" + val["pcpu"] + "</td></tr>"
    $('#stat_table > tbody').prepend s

@populateTable = (data) ->
  updateTable data
  setInterval ->
    $.getJSON document.location, (data) ->
      updateTable data["data"]



