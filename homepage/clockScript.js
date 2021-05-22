function startTime() {
  // Get time values
  var today = new Date()
  var hr = today.getHours()
  var min = today.getMinutes()
  var sec = today.getSeconds()

  // Add a zero in front of numbers<10
  min = checkTime(min)
  sec = checkTime(sec)
  document.getElementById('clock').innerHTML = hr + ' : ' + min + ' : ' + sec
  var time = setTimeout(function() {
    startTime()
  }, 500)
}

function checkTime(i) {
  if (i < 10) {
    i = '0' + i
  }
  return i
}
