Browser dev tools
![[Pasted image 20250722133359.png]]

Curl - <https://curl.se/> (run http requests on the terminal)

Postman - <https://www.postman.com/> (make api requests)

Burpsuite - <https://portswigger.net/burp/communitydownload> (intercept traffic)

Docker - <https://www.docker.com/>

MitmProxy - <https://mitmproxy.org/>

Arjun - https://github.com/s0md3v/Arjun

Kiterunner - https://github.com/assetnote/kiterunner

jwttool - <https://github.com/ticarpi/jwt_tool> (tamper JWT headers)

Zap - <https://www.zaproxy.org/> (automate scanning)

Metasploit - <https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html>

nmap - `namp -p- target.com` -> scan all tcp ports
		`nmap -sC -sV target.com` version and services running, default upto port 1000

amass - maps directories and surface attack scan (https://github.com/owasp-amass/amass)
		Either active or passive via search engines, ssl certs, web archieve
		`amass enum -active -d target.com`
		
 Gobuster - directory bruteforce (https://github.com/OJ/gobuster)
			`gobuster dir -u target.com -w wordlist`