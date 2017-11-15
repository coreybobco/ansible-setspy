server {
	listen 80;
	listen [::]:80;

	server_name setlistspy.com;

	location / {
		add_header 'Access-Control-Allow-Origin' '*';
		add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
		proxy_pass         http://127.0.0.1:9000/;
	}
}
