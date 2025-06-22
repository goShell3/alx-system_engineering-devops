A one-server web infrastructure that hosts www.foobar.com
Components:
- 1 server (IP: 8.8.8.8)
- 1 web server (Nginx)
- 1 application server
- 1 MySQL database
- Application code (backend + frontend)
- Domain name: foobar.com with an A record pointing www.foobar.com to 8.8.8.8

Flow:
User → DNS Lookup (www.foobar.com → 8.8.8.8) → Nginx → App Server → MySQL → App Server → Nginx → User

Roles:
- Server: hosts the website and database.
- Domain name: human-readable address for users.
- DNS Record: A record for www.foobar.com → 8.8.8.8.
- Web Server (Nginx): handles requests, static content, reverse proxy.
- App Server: executes code, handles dynamic content.
- Database (MySQL): stores site data.
- Communication: HTTP over TCP/IP.

Issues:
- SPOF
- Downtime during updates
- Cannot scale to handle high traffic
