local_cdn uses Ruby, [Rack](https://rack.github.io/) and [Pow](http://pow.cx/) to run a local CDN (Content Distribution Network) that hosts common files such as jquery, bootstrap, etc often served by CDN's such as Google, NetDNA, Cloudflare, etc. By using local_cdn and updating your HOSTS file, when a CDN is employed by a website, the shared resource will be served from your local machine instead of the CDN.

Unfortunately local_cdn does not yet support SSL (which severely limits the utility of this project), so please consider this to be an alpha project.

INSTALLATION
============

Installation instructions are for *nix machines.  These instructions have not been tested on Windows.

* Clone this repository onto your local machine.
* Run `bundle install` in the repository directory.
* Install [Pow](http://pow.cx/)
* Go to `~/.pow/` on your local machine, and symlink the full path of this repository as `default` (so `~/.pow/default` should link to the local_cdn directory).  See the [Pow manual](http://pow.cx/manual.html) for more details.
* Add the content of the repository's HOSTS file to your `/etc/HOSTS` file, so requests to various CDN's are rerouted to your local machine.


TESTING
=======

To confirm that your server is running on port 80, run:

    $ curl -I http://localhost/is_local_cdn

You should see a `200 OK` response.

To confirm that requests to CDN's are being routed to your local server, run:

    $ curl -I http://HOSTNAME/is_local_cdn

where HOSTNAME is one of the CDN hosts (e.g. maxcdn.bootstrapcdn.com)


UPDATING
========

New libraries may be added to this repository.  Simply `git pull` to update this repository to load the new libraries.  The list of included libraries is in the file `LIBRARIES`.


ADDING LIBRARIES MANUALLY
=========================

To add a new library:

  * Identify the URL of the library in the HTML source code
  * Add the URL to `LIBRARIES`
  * Temporarily comment out the CDN host from your HOSTS file
  * Run `ruby scripts/download_libs.rb` to download to the local CDN
  * Uncomment the CDN host in your HOSTS file


Alternatives to Pow
-------------------

Pow runs on port 80, which makes it appealing for this purpose.  But any static web server running on port 80 will do, including Apache, Nginx, [SimpleHTTPServer](https://docs.python.org/2/library/simplehttpserver.html), etc.

One simple alternative to using Pow would be to navigate to the `public` directory and run:

    $ sudo python -m SimpleHTTPServer 80
