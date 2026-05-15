async function searchFlights() {
  const from = document.getElementById("from").value;
  const to = document.getElementById("to").value;
  const date = document.getElementById("date").value;

  try {
    const res = await fetch(
      `http://localhost:3000/flights?from=${from}&to=${to}&date=${date}`
    );

    const data = await res.json();

    console.log("FLIGHT DATA:", data);

    displayFlights(data.data);   // ← now this works
  } catch (err) {
    alert("Failed to fetch flights ❌");
    console.error(err);
  }
}


function displayFlights(flights) {
  const container = document.getElementById("results");
  container.innerHTML = "";

  if (!flights || flights.length === 0) {
    container.innerHTML = "<p>No flights found.</p>";
    return;
  }

  flights.forEach(flight => {
    const segment = flight.itineraries[0].segments[0];

    const card = document.createElement("div");
    card.style.background = "#111";
    card.style.color = "white";
    card.style.padding = "15px";
    card.style.marginBottom = "10px";
    card.style.borderRadius = "10px";

    card.innerHTML = `
      <h3>${segment.departure.iataCode} → ${segment.arrival.iataCode}</h3>
      <p>✈ Airline: ${segment.carrierCode}</p>
      <p>🕒 Departure: ${segment.departure.at}</p>
      <p>🕓 Arrival: ${segment.arrival.at}</p>
      <p>💺 Seats left: ${flight.numberOfBookableSeats}</p>
    `;

    container.appendChild(card);
  });
}
