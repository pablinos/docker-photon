# docker-photon

A docker container for running Photon.

## Usage

1. Install Docker.
1. Clone the project into a local directory
  * `git clone https://github.com/pablinos/docker-photon.git docker-photon`
1. In a command prompt, change into the new directory with `cd docker-photon`
1. Run `docker build -t photon .`
1. Run `docker run -d -p 8000:80 photon`

You can access Photon by visiting [http://localhost:8000/](http://localhost:8000/).

Try it: [http://localhost:8000/s.w.org/about/images/logos/wordpress-logo-notext-rgb.png?colorize=241,131,30&filter=negate](http://localhost:8000/s.w.org/about/images/logos/wordpress-logo-notext-rgb.png?colorize=241,131,30&filter=negate)
