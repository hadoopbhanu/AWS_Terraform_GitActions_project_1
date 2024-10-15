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
  <title>Welcome to Your Fun EC2 Instance!</title>
  <style>
    body {
      background-color: #222;
      color: #fff;
      text-align: center;
      font-family: 'Comic Sans MS', cursive;
    }
    h1 {
      color: #FF6347;
      font-size: 50px;
      margin-top: 10%;
    }
    p {
      color: #00FF7F;
      font-size: 24px;
    }
    button {
      background-color: #1E90FF;
      color: white;
      border: none;
      padding: 15px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin-top: 20px;
      cursor: pointer;
    }
    button:hover {
      background-color: #00BFFF;
    }
    @keyframes fireworks {
      0% { opacity: 0; transform: scale(0); }
      50% { opacity: 1; transform: scale(1); }
      100% { opacity: 0; transform: scale(0); }
    }
  </style>
</head>
<body>
  <h1>Welcome to AWS!</h1>
  <p>Your EC2 instance is now live with a fun webserver 🎉</p>
  <p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
  <p><strong>Instance Type:</strong> ${INSTANCE_TYPE}</p>
  <p><strong>Availability Zone:</strong> ${AVAILABILITY_ZONE}</p>
  <button onclick="showFireworks()">Click me for a surprise!</button>

  <div id="fireworks" style="display: none;">
    <h1>You are amazing! 🎆🎇</h1>
  </div>

  <script>
    function showFireworks() {
      const fireworks = document.getElementById('fireworks');
      fireworks.style.display = 'block';
      fireworks.style.animation = 'fireworks 2s ease-in-out';
      setTimeout(() => {
        fireworks.style.display = 'none';
      }, 3000);
    }
  </script>
</body>
</html>
EOF

# Start the Apache web server
systemctl start httpd
systemctl enable httpd