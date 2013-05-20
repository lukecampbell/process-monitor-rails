@updateTable = (data) ->
  $('#stat_table > tbody').empty()
  $.each data, (i,val) ->
    s = "<tr><td>" + val["created_at"] + "</td><td>" + val["rss"] + "</td><td>" + val["pmem"] + "</td><td>" + val["pcpu"] + "</td></tr>"
    $('#stat_table > tbody').append s

@initializeTable = (data) ->
  updateTable data



