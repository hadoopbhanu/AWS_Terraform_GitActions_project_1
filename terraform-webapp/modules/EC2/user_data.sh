#!/bin/bash
# Update packages and install Apache web server
yum update -y
yum install -y httpd

# Fetch instance metadata and store it in variables
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
INSTANCE_TYPE=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
AVAILABILITY_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create a fun HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Amazing EC2 Instance Party 🎉</title>
  <style>
    body {
      background-color: #111;
      color: #fff;
      text-align: center;
      font-family: 'Comic Sans MS', cursive;
    }
    h1 {
      color: #FF6347;
      font-size: 48px;
      margin-top: 10%;
    }
    p {
      color: #00FF7F;
      font-size: 22px;
    }
    button {
      background-color: #1E90FF;
      color: white;
      border: none;
      padding: 15px 32px;
      margin-top: 20px;
      font-size: 18px;
      cursor: pointer;
    }
    button:hover {
      background-color: #00BFFF;
    }
    canvas {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
    }
  </style>
</head>
<body>
  <h1>Welcome to Your Party EC2 Instance! 🎉</h1>
  <p>Your instance is live and ready to celebrate!</p>
  <p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
  <p><strong>Instance Type:</strong> ${INSTANCE_TYPE}</p>
  <p><strong>Availability Zone:</strong> ${AVAILABILITY_ZONE}</p>
  <button onclick="triggerConfetti()">Celebrate with a Surprise! 🎊</button>

<canvas id="fireworks-canvas"></canvas>

<script>
  const canvas = document.getElementById('fireworks-canvas');
  const ctx = canvas.getContext('2d');
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  let particles = [];
  const colors = ['#FF6347', '#FFD700', '#00FF7F', '#1E90FF', '#FF69B4'];

  // Function to create a firework burst at (x, y) with multiple particles
  function createFirework(x, y) {
    for (let i = 0; i < 50; i++) {
      particles.push({
        x: x,
        y: y,
        dx: Math.random() * 4 - 2, // Random horizontal movement
        dy: Math.random() * 4 - 2, // Random vertical movement
        radius: Math.random() * 3 + 2, // Random particle size
        color: colors[Math.floor(Math.random() * colors.length)], // Random color
        life: 80 + Math.random() * 40, // Random lifespan for each particle
      });
    }
  }

  // Function to update and animate particles
  function updateParticles() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    particles.forEach((p, index) => {
      p.x += p.dx;
      p.y += p.dy;
      p.radius *= 0.98; // Gradually shrink particles
      p.life--;

      ctx.beginPath();
      ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
      ctx.fillStyle = p.color;
      ctx.fill();

      // Remove particles that have completed their lifespan
      if (p.life <= 0) {
        particles.splice(index, 1);
      }
    });
  }

  // Main animation loop to render the fireworks continuously
  function animateFireworks() {
    updateParticles();
    if (particles.length > 0) {
      requestAnimationFrame(animateFireworks);
    }
  }

  // Function to create multiple fireworks randomly across the screen
  function triggerMultipleFireworks() {
    for (let i = 0; i < 5; i++) {
      const x = Math.random() * canvas.width;
      const y = Math.random() * canvas.height;
      createFirework(x, y); // Create fireworks at random locations
    }
    animateFireworks();

    // Clear the fireworks after 5 seconds
    setTimeout(() => {
      particles = [];
      ctx.clearRect(0, 0, canvas.width, canvas.height);
    }, 5000);
  }

  // Attach the trigger to the button click
  document.querySelector('button').addEventListener('click', triggerMultipleFireworks);
</script>
</body>
</html>
EOF

# Start the Apache web server
systemctl start httpd
systemctl enable httpd