# NGINX RTMP Docker

A minimal docker image that can be used for RTMP streaming with a basic web
UI that will stream either HLS or DASH based streams.

This is based on the work of [ustoopia][1] who provided a simple Windows
based RTMP setup. This provided the base html/js for the players and some of
the NGINX configuration.

Please note that this configuration is not particularly secure, allowing streaming
or viewing from any IP. Use at your own risk.

[1]: https://github.com/ustoopia/Live-stream-server-portable-Windows-Nginx-RTMP-HLS-Dash

## Usage

The is a docker compose file so usage should be simple. Pull the source code and
open a console window in the repository root. Then run `docker-compose up`.

This should build and run the service with the following port configured:

| Host Port | Purpose        | URL                         |
| --------- | -------------- | --------------------------- |
| 10000     | RTMP streaming | rtmp://localhost:10000/live |
| 10001     | Web site       | http://localhost:10001      |

### OBS

To use with OBS create a new profile with a custom streaming target. Use the URL
`rtmp://localhost:10000/live` and a stream path of `stream`. Ensure the service
is started and then start streaming.

It can take 5-10 seconds for the stream to be usable on the service web interface
due to buffering.

