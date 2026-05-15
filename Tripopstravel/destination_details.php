<?php
session_start();
$conn = new mysqli("localhost","root","","tripops_db");
if ($conn->connect_error) die("DB Error");
$current_page = 'destination';

$slug = $_GET['place'] ?? '';
$stmt = $conn->prepare("SELECT * FROM destination_details WHERE slug=?");
$stmt->bind_param("s",$slug);
$stmt->execute();
$dest = $stmt->get_result()->fetch_assoc();
if(!$dest) die("Destination not found");
$id = $dest['id'];
/* ================= DESTINATION REVIEWS ================= */
$user_id = $_SESSION['user_id'] ?? null;
/* ADD REVIEW */
if(isset($_POST['add_review']) && $user_id){
    $review = trim($_POST['review']);

    if($review != ""){
        $stmt = $conn->prepare("INSERT INTO destination_reviews(destination_id,user_id,review) VALUES(?,?,?)");
        $stmt->bind_param("iis",$id,$user_id,$review);
        $stmt->execute();

        header("Location: destination_details.php?place=".$slug."#reviews");
        exit;
    }
}
/* DELETE REVIEW */
if(isset($_POST['delete_review']) && $user_id){
    $rid = intval($_POST['review_id']);

    $stmt = $conn->prepare("DELETE FROM destination_reviews WHERE id=? AND user_id=?");
    $stmt->bind_param("ii",$rid,$user_id);
    $stmt->execute();

    header("Location: destination_details.php?place=".$slug."#reviews");
    exit;
}
/* FETCH REVIEWS */
$stmt = $conn->prepare("
SELECT r.*, u.name, u.email, u.profile_pic
FROM destination_reviews r
JOIN users u ON r.user_id = u.id
WHERE r.destination_id = ?
ORDER BY r.created_at DESC
");
$stmt->bind_param("i",$id);
$stmt->execute();
$reviews = $stmt->get_result();
$gallery = $conn->query("SELECT * FROM destination_gallery WHERE destination_id=$id");
$attractions = $conn->query("SELECT * FROM destination_attractions WHERE destination_id=$id ORDER BY display_order ASC");
$restaurants = $conn->query("SELECT * FROM destination_restaurants WHERE destination_id=$id");
$experiences = $conn->query("SELECT * FROM destination_experiences WHERE destination_id=$id");
// WEATHER
$apiKey = "b99c39ca3a2621f4a47c6008b4904806";
$city = urlencode($dest['name']);
$weatherData = file_get_contents("https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey");
$weather = json_decode($weatherData, true);
date_default_timezone_set('Asia/Kolkata');
$currentTime = date('D, d M Y H:i A');
?>
<!DOCTYPE html>
<html>
<head>
  <title><?= $dest['name'] ?> | TripOps</title>
  <link rel="stylesheet" href="destination_details.css">
</head>
<body>
<!-- HERO -->
 <div class="hero-top">
        <div class="logo">TripOps</div>
        <div class="nav-menu">
            <a href="landing.php" class="<?= $current_page=='landing'?'active':'' ?>">HOME</a>
            <a href="destination.php" class="<?= $current_page=='destination'?'active':'' ?>">DESTINATION</a>
            <a href="route-and-rest-main/booking-page.html">BOOKING</a>
            <a href="aboutus.html">ABOUT US</a>
        </div></div>
<section class="hero">
  <img src="<?= $gallery->fetch_assoc()['image'] ?>">
  <div class="hero-text">
    <h1><?= $dest['name'] ?></h1>
    <p><?= $dest['country'] ?></p>
  </div>
</section>
<!-- TABS -->
<nav class="tabs">
  <button onclick="showTab('overview')" class="active">Overview</button>
  <button onclick="showTab('attractions')">Attractions</button>
  <button onclick="showTab('food')">Food</button>
  <button onclick="showTab('experiences')">Experiences</button>
  <button onclick="showTab('languages')">Languages</button>
  <button onclick="showTab('currency')">Currency</button>
</nav>
<!-- OVERVIEW -->
<section id="overview" class="tab-content active">
  <div class="overview-container">
    <!-- ABOUT -->
    <div class="overview-text-full">
      <span class="badge">About the Destination</span>
      <h2>Welcome to <?= $dest['name'] ?></h2>
      <p class="overview-desc"><?= $dest['description'] ?></p>
    </div>
    <!-- WIDGETS ROW -->
    <div class="overview-widgets">
      <!-- QUICK INFO -->
      <div class="quick-info-widget">
        <h3>Quick Info</h3>
        <div class="info-grid">
          <div class="info-card">
            <strong>Country</strong>
            <span><?= htmlspecialchars($dest['country']) ?></span>
          </div>
          <div class="info-card">
            <strong>Best Time</strong>
            <span><?= htmlspecialchars($dest['best_time']) ?></span>
          </div>
          <div class="info-card">
            <strong>Known For</strong>
            <span><?= htmlspecialchars($dest['highlights']) ?></span>
          </div>
        </div>
      </div>
      <!-- WEATHER -->
      <div class="weather-widget">
        <?php if($weather && isset($weather['main'])): ?>
          <h3>Current Weather</h3>
          <p class="weather-time"><?= $currentTime ?></p><br><br>
          <div class="weather-card">
            <img src="https://openweathermap.org/img/wn/<?= $weather['weather'][0]['icon'] ?>@2x.png">
            <div class="weather-details">
              <span class="temp"><?= round($weather['main']['temp']) ?>°C</span><br>
              <span><?= ucfirst($weather['weather'][0]['description']) ?></span>
              <span>Feels like: <?= round($weather['main']['feels_like']) ?>°C</span>
              <span>Humidity: <?= $weather['main']['humidity'] ?>%</span>
              <span>Wind: <?= $weather['wind']['speed'] ?> m/s</span>
            </div>
          </div>
        <?php else: ?>
          <p>Weather not available</p>
        <?php endif; ?>
      </div>
      <!-- CURRENCY -->
      <div class="quick-info-widget">
        <h3>Currency</h3>
        <div class="info-grid">
          <div class="info-card">
            <strong>Currency</strong>
            <span><?= htmlspecialchars($dest['currency_name']) ?></span>
          </div>
          <div class="info-card">
            <strong>Code</strong>
            <span><?= htmlspecialchars($dest['currency_code']) ?></span>
          </div>
          <div class="info-card">
            <strong>Symbol</strong>
            <span><?= htmlspecialchars($dest['currency_symbol']) ?></span>
          </div>
        </div>
      </div>
    </div> <!-- overview-widgets -->
  </div> <!-- overview-container -->
  <!-- commongestures -->
</section>
<!-- ATTRACTIONS -->
<section id="attractions" class="tab-content">
  <div class="grid">
    <?php while($a=$attractions->fetch_assoc()): ?>
      <div class="card">
        <img src="attractions/<?= $a['image'] ?>" alt="<?= htmlspecialchars($a['name']) ?>">
        <h3><?= $a['name'] ?></h3>
        <p><?= $a['description'] ?></p>
      </div>
    <?php endwhile; ?>
  </div>
</section>
<!-- RESTAURANTS -->
<section id="food" class="tab-content">
  <div class="grid">
    <?php while($r = $restaurants->fetch_assoc()): ?>
      <div class="card">
        <img src="food/<?= htmlspecialchars($r['image']) ?>" alt="<?= htmlspecialchars($r['name']) ?>">
        <h3>
          <?= htmlspecialchars($r['name']) ?>
          <!-- Star Ratings -->
          <span class="stars" style="color: gold; font-size: 16px; margin-left: 5px;">
            <?php
            $rating = $r['rating'] ?? 5; // default 5 stars
            for ($i = 1; $i <= 5; $i++) {
                echo ($i <= $rating) ? '★' : '☆';
            }
            ?>
          </span>
        </h3>
        <p><strong>Cuisine:</strong> <?= htmlspecialchars($r['cuisine']) ?></p>
        <p><?= htmlspecialchars($r['description']) ?></p>
      </div>
    <?php endwhile; ?>
  </div>
</section>
<!-- EXPERIENCES -->
<section id="experiences" class="tab-content">
  <div class="grid">
    <?php while($e = $experiences->fetch_assoc()): ?>
      <div class="card">
        <img src="experiences/<?= htmlspecialchars($e['image']) ?>" alt="<?= htmlspecialchars($e['name']) ?>">
        <h3><?= htmlspecialchars($e['name']) ?></h3>
        <p><?= htmlspecialchars($e['description']) ?></p>
      </div>
    <?php endwhile; ?>
  </div>
</section>
<section id="languages" class="tab-content">
  <?php 
    // This looks for a file like 'lang-goa.html' based on the URL (?place=goa)
    $languageFile = "lang-" . $slug . ".html"; 

    if (file_exists($languageFile)) {
        // This 'attaches' the HTML file directly into this section
        include($languageFile);
    } else {
        // Fallback message if the file is missing
        echo "<div style='padding:40px; text-align:center;'>";
        echo "<h3>Language Guide Coming Soon!</h3>";
        echo "<p>We are currently working on the translation guide for " . htmlspecialchars($dest['name']) . ".</p>";
        echo "</div>";
    }
  ?>
</section>
<section id="currency" class="tab-content">
  <div class="currency-container">
    <div class="currency-card">
      <h2>Currency Converter</h2>
      <div class="converter-box">
        <input type="number" id="conv-amount" placeholder="Enter Amount" value="1">

        <div class="converter-row-inline">
          <div class="select-wrapper">
            <select id="conv-from">
              <option value="INR" selected>INR - ₹</option>
              <option value="USD">USD - $</option>
              <option value="EUR">EUR - €</option>
              <option value="GBP">GBP - £</option>
              <option value="JPY">JPY - ¥</option>
              <option value="AUD">AUD - A$</option>
            </select>
          </div>
          <i class="fas fa-exchange-alt"></i>
          <div class="select-wrapper">
            <select id="conv-to">
              <option value="INR">INR - ₹</option>
              <option value="USD" <?= ($dest['currency_code'] == 'USD') ? 'selected' : '' ?>>USD - $</option>
              <option value="EUR" <?= ($dest['currency_code'] == 'EUR') ? 'selected' : '' ?>>EUR - €</option>
              <option value="GBP" <?= ($dest['currency_code'] == 'GBP') ? 'selected' : '' ?>>GBP - £</option>
              <option value="JPY" <?= ($dest['currency_code'] == 'JPY') ? 'selected' : '' ?>>JPY - ¥</option>
              <option value="AUD" <?= ($dest['currency_code'] == 'AUD') ? 'selected' : '' ?>>AUD - A$</option>
            </select>
          </div>
        </div>
        <button class="convert-btn-main" onclick="runConversion()">Convert Now</button>
        <div id="conv-result" class="result-display">Ready to convert</div>
      </div>
    </div>
  </div>
</section>
<!-- Hero or wherever you want the button -->
<section class="get-started-section">
<button class="get-started" 
onclick="window.location.href='trip_dashboard.php?place=<?= urlencode($slug) ?>'">Start Booking</button>
</section>
<section class="reviews-section" id="reviews">
    <h2>Traveler Reviews</h2>
    <?php if(isset($_SESSION["user_id"])): ?>
        <form method="POST" class="review-form">
            <textarea name="review" placeholder="Share your experience at <?= htmlspecialchars($dest['name']) ?>..." required></textarea>
            <div style="text-align: right;">
                <button name="add_review">Post Review</button>
            </div>
        </form>
    <?php else: ?>
        <div style="text-align:center; padding: 20px; background: #eee; border-radius: 10px; margin-bottom: 30px;">
            <p>Please <a href="login.php" style="color:#2f89a8; font-weight:bold;">login</a> to write a review.</p>
        </div>
    <?php endif; ?>
    <div class="reviews-container">
        <?php while($r = $reviews->fetch_assoc()): ?>
            <div class="review-card">
                <div class="review-header">
                    <div class="review-user">
                        <div class="avatar">
                            <?php if($r['profile_pic'] && file_exists($r['profile_pic'])): ?>
                                <img src="<?= $r['profile_pic'] ?>" alt="Profile">
                            <?php else: ?>
                                <?= strtoupper(substr($r['name'], 0, 1)) ?>
                            <?php endif; ?>
                        </div>
                        <div>
                            <strong><?= htmlspecialchars($r['name']) ?></strong><br>
                            <a href="mailto:<?= htmlspecialchars($r['email']) ?>" class="contact-link">
                                <i class="far fa-envelope"></i> Contact Traveler
                            </a>
                        </div>
                    </div>
                    <span class="review-date">
                        <?= date('d M Y', strtotime($r['created_at'])) ?>
                    </span>
                </div>

                <p class="review-body"><?= nl2br(htmlspecialchars($r['review'])) ?></p>

                <?php if(isset($_SESSION['user_id']) && $_SESSION['user_id'] == $r['user_id']): ?>
                    <form method="POST" style="text-align: right;">
                        <input type="hidden" name="review_id" value="<?= $r['id'] ?>">
                        <button name="delete_review" class="delete-btn">Delete Review</button>
                    </form>
                <?php endif; ?>
            </div>
        <?php endwhile; ?>
    </div>
</section>
<script>
function showTab(id){
  document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.tabs button').forEach(b => b.classList.remove('active'));
  document.getElementById(id).classList.add('active');
  event.target.classList.add('active');
}
const conversionRates = {
    INR: 1,
    USD: 0.012,
    EUR: 0.011,
    GBP: 0.0096,
    JPY: 1.62,
    AUD: 0.018
};
function runConversion() {
    const amount = parseFloat(document.getElementById('conv-amount').value);
    const from = document.getElementById('conv-from').value;
    const to = document.getElementById('conv-to').value;
    const resultDiv = document.getElementById('conv-result');

    if (isNaN(amount) || amount <= 0) {
        resultDiv.textContent = "Please enter a valid amount";
        return;
    }
    // Calculation logic based on your rates
    const inINR = amount / conversionRates[from];
    const converted = inINR * conversionRates[to];
    
    resultDiv.innerHTML = `${amount} ${from} = <br><strong>${converted.toFixed(2)} ${to}</strong>`;
}
</script>
</body>
</html>
<?php
// Get the current filename
$current_file = basename($_SERVER['PHP_SELF']);
// Only show if the current page is NOT landing.php
if ($current_file !== 'landing.php') {
    include 'popup.php';
}
?>