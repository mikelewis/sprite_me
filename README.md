SpriteMe!
=============

## Dynamic Image Spriter.

### Motivation

Too many http requests can slow down the perceived page load time + actual load time for users. This is why spriting exists, however this technique only works with static images (such as logo, navigation items, etc). However taking advatage of a fast web service that makes asynchronous calls and handles caching can allow you to sprite/data-uri any image on the web. Think facepiles.

### Usage
Best used when set behind a proxy to load balance requests such as HAProxy. You should also consider setting up a proxy such as squid to cache the http requests, you can do this in the configuration file you pass in with `-c`.

Pass in the required parameter `images`, that takes an array of urls to download + sprite/data-uri.
Optionally pass in the parameter: `callback=some_js_func` for JSONP support.

## Example

`bundle exec ruby bin/sprite_me -sv --config=/Users/mike/code/ruby/sprite_me/config/development.rb`

    http://localhost:9000/?images=["http://domain.com/profile/234/normal.jpg","http://domain.com/profile/999/small.jpg"]&callback=load_images

### This isn't production ready! This is a personal project that will probably develop into something bigger sometime later.

##License

Copyright (c) 2012 Mike Lewis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.