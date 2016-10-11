### base 64 encoding ##

http://stackoverflow.com/questions/11152643/base64-is-not-encoding-in-ajax
https://developer.mozilla.org/en-US/docs/data_URIs

Use window.atob() and window.btoa() functions on chrome and mozilla, however they might not work on IE and also can give errors when the string is not 8bit encodeable. Look for Unicode problem in the next link

https://developer.mozilla.org/en-US/docs/data_URIs

One alernative is to use this to encode : window.btoa(encodeURIcomponent(escape(string)));
and decode unescape(decodeURIcomponent(window.ato(encodedstring)));


Alternatively get a base64 encode decode js libraries

## Escape vs encodeURI vs encodeURIComponent ###
http://xkr.us/articles/javascript/encode-compare/
http://gw8311.wordpress.com/2011/04/21/escape-vs-encodeuri-vs-encodeuricomponent/

### End of base 64 encoding ##


### Mini drag and drop ajax file uploader ##
http://tutorialzine.com/2013/05/mini-ajax-file-upload-form/


## Jquery get attr values from a list of elements
var list = $(".object").map(function(){return $(this).attr("level");}).get();
