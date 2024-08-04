const eventSource = new EventSource('/events')
eventSource.onmessage = function(event) {
  const entries = JSON.parse(event.data)
  const tableBody = document.getElementById('entriesTable').getElementsByTagName('tbody')[0]
  
  tableBody.innerHTML = ''
  
  entries.forEach(entry => {
  const row = tableBody.insertRow()
  row.className = "border-b"

  const cellNumber = row.insertCell(0)
  cellNumber.innerText = entry.number
  cellNumber.className = "py-2 text-center"

  const cellTitle = row.insertCell(1)
  cellTitle.innerText = entry.title
  cellTitle.className = "py-2"

  const cellPoints = row.insertCell(2)
  cellPoints.innerText = entry.points
  cellPoints.className = "py-2 text-center"

  const cellComments = row.insertCell(3)
  cellComments.innerText = entry.comments
  cellComments.className = "py-2 text-center"
  })
}

eventSource.onerror = function(error) {
  console.error("EventSource failed:", error)
  eventSource.close()
}