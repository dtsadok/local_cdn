local_cdn uses Ruby, [Rack](https://rack.github.io/) and [Pow](http://pow.cx/) to run a local CDN (Content Distribution Network) that hosts common files like jquery, bootstrap, etc often served by CDN's such as Google, NetDNA, Cloudflare, etc.  Instead of making a request to those services when a CDN is employed, the shared resource is served from your local machine, using a similar path to the public CDN's.

INSTALLATION
============

Installation instructions are for *nix machines.  These instructions have not been tested on Windows.

* Clone this repository onto your local machine.
* Run `bundle install` in the repository directory.
* Install [Pow](http://pow.cx/)
* Go to `~/.pow/` on your local machine, and symlink the full path of this repository as `default` (so `~/.pow/default` should link to the local_cdn directory).  See the [Pow manual](http://pow.cx/manual.html) for more details.
* Add the content of the repository's HOSTS file to your `/etc/HOSTS` file, so requests to various CDN's are rerouted to your local machine.


Why Pow?
--------

Pow runs on port 80, which makes it appealing for this purpose.  But any static web server running on port 80 will do, including Apache, Nginx, [SimpleHTTPServer](https://docs.python.org/2/library/simplehttpserver.html), etc.

A simple alternative to using Pow would be to navigate to the `public` directory and run:

    $ sudo python -m SimpleHTTPServer 80


UPDATING
========

New libraries may be added to this repository.  Simply `git pull` to update this repository to load the new libraries.  The list of included libraries is in the file `LIBRARIES`.
