#!/bin/bash
yum update -y
yum install -y httpd

cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Welcome to Your Fun EC2 Instance!</title>
  <style>
    body { background-color: #222; color: #fff; text-align: center; font-family: 'Comic Sans MS', cursive; }
    h1 { color: #FF6347; font-size: 50px; margin-top: 20%; }
    p { color: #00FF7F; font-size: 24px; }
    button { background-color: #1E90FF; color: white; padding: 15px 32px; font-size: 16px; cursor: pointer; }
    button:hover { background-color: #00BFFF; }
  </style>
</head>
<body>
  <h1>Welcome to AWS!</h1>
  <p>Your EC2 instance is now live with a fun webserver 🎉</p>
  <button onclick="alert('Have a great day! 🎈')">Click me for a surprise!</button>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd