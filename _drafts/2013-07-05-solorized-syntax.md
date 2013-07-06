---
layout: post
title: solarized-syntax
date: 2013-07-05 04:13:05
colors: ["#ffffff", "#999988", "#a61717", "#e3d2d2", "#999999", "#000000", "#ffdddd", "#ffaaaa", "#aa0000", "#ddffdd", "#aaffaa", "#888888", "#555555", "#aaaaaa", "#445588", "#009999", "#d14", "#008080", "#0086B3", "#800080", "#990000", "#000080", "#bbbbbb", "#009926", "#990073"]

default_pg: ["#ffffcc", "#ffffff", "#888888", "#FF0000", "#FFAAAA", "#008800", "#333333", "#557799", "#cc0000", "#A00000", "#000080", "#00A000", "#c65d09", "#800080", "#0044DD", "#003388", "#333399", "#6600EE", "#fff0f0", "#0000CC", "#007020", "#BB0066", "#003366", "#555555", "#880000", "#0066BB", "#997700", "#0e84b5", "#007700", "#996633", "#000000", "#bbbbbb", "#005588", "#0000DD", "#4400EE", "#DD4422", "#666666", "#eeeeee", "#DD2200", "#fff0ff", "#AA6600", "#336699", "#dd7700", "#3333BB"]
---

# Soloraized Syntax Highlighting

{% highlight ruby %}
include Enumerable
module Jekyll
    module RemoveIndexHTMLFilter
        def rm_index_html(input)
            input.match(/(.*)\/index\./)[1]
            self = @hello + :hey
        end
    end
end
Liquid::Template.register_filter(Jekyll::RemoveIndexHTMLFilter)
{% endhighlight %}


<ol>
{% for c in page.default_pg %}<li><span style="color:{{c}}">{{c}}</span></li> {% endfor %}
</ol>