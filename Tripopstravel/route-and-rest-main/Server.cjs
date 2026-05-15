require("dotenv").config();
const express = require("express");
const cors = require("cors");


const app = express();
app.use(cors());
app.use(express.static(__dirname));


const PORT = 3000;

let accessToken = null;

/* ===== GET AMADEUS TOKEN ===== */
async function getToken() {
  console.log("🔑 Requesting Amadeus token...");

  const params = new URLSearchParams();
 params.append("client_id", process.env.AMADEUS_CLIENT_ID);
 params.append("client_secret", process.env.AMADEUS_CLIENT_SECRET);
  params.append("client_secret", "sample_client_secret");

  const res = await fetch(
    "https://test.api.amadeus.com/v1/security/oauth2/token",
    {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: params,
    }
  );
const data = await res.json();
accessToken = data.access_token;
console.log("🔑 TOKEN RESPONSE:", data);

}

/* ===== FLIGHT SEARCH ===== */
app.get("/flights", async (req, res) => {
  try {
    const { from, to, date } = req.query;

    console.log("✈️ Flight search:", from, to, date);

    if (!from || !to || !date) {
      return res.status(400).json({ error: "Missing parameters" });
    }

    /* Always refresh token for safety */
    await getToken();

    const apiRes = await fetch(
      `https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=${from}&destinationLocationCode=${to}&departureDate=${date}&adults=1&max=5`,
      {
        headers: { Authorization: `Bearer ${accessToken}` },
      }
    );

    const data = await apiRes.json();

    console.log("✈️ AMADEUS FLIGHT DATA RECEIVED");

    res.json(data);
  } catch (err) {
    console.error("🔥 SERVER ERROR:", err);
    res.status(500).json({ error: "Flight fetch failed" });
  }
});

app.listen(PORT, () => {
  console.log(`🚀 Server running → http://localhost:${PORT}`);
});
/* ===== AIRPORT AUTOCOMPLETE ===== */
app.get("/airports", async (req, res) => {
  try {
    const { keyword } = req.query;

    if (!keyword) return res.json([]);

    await getToken();

    const apiRes = await fetch(
      `https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY,AIRPORT&keyword=${keyword}&page[limit]=5`,
      {
        headers: { Authorization: `Bearer ${accessToken}` }
      }
    );

    const data = await apiRes.json();

    res.json(data.data || []);
  } catch (err) {
    console.error("Airport search error:", err);
    res.json([]);
  }
});


