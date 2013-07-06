---
title: Remove index.html
date: 2013-07-04 23:17:57
layout: post

---

# Alphabetic URLS

SHORT URLS like [prolost.com/tv][tv], easy enough to *type* in a browser are rarely the default. Worse, date information like 
**/2013/07/05/** are often prefixed. However in a static blog generator it may be easy to achieve.

## /alphabetic-urls/index.html

Static gener

{% highlight ruby %}
input.scan(/(.*)\/index\./)[1]
{% endhighlight %}


[plugins]: http://jekyllrb.com/docs/plugins/
[permalinks]: http://jekyllrb.com/docs/permalinks/
[tv]: http://prolost.com/tv