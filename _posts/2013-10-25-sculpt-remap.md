---
layout: post
title: Sculpt Ergonomic Key Remap
sub: introductory keyboard remap
---

# Sculpt Ergonomic<br>Key Remap

WHERE the right-hand `Option/Alt` key ought to be, Microsoft's [Sculpt Ergonomic Destop][review] keyboard has instead a key Mac does not use. After fixing it with [KeyRemap4MacBook][app] I find the process an excellent demonstration of the key remapping app.

[app]: https://pqrs.org/macosx/keyremap4macbook/

## The remap syntax

To remap keys in **KeyRemap** is to describe key relationships in a [text file][privatexml] using a special syntax. For example:

{% highlight xml %}
__KeyToKey__
KeyCode::W,
KeyCode::T
{% endhighlight %}

When this remap is activated, hitting the `W` key will produce a `T` instead. Finding the key code for the offending key is done through KeyRemap's **EventViewer**. 

## Finding the key code

The [EventViewer][viewer] records keystrokes and displays their key codes. Hitting the functionless key reveals its key code to be `PC_APPLICATION`. The core code is now ready:

{% highlight xml %}
__KeyToKey__
KeyCode::PC_APPLICATION,
KeyCode::OPTION_R
{% endhighlight %}

## Limiting remap to the device

EventViewer can also find the keyboard's product ID, with which the remapping can be limited to occur *only* on the Sculpt Ergonomic Keyboard. First the product ID needs a proper name:

{% highlight xml %}
<deviceproductdef>
  <productname>SCULPT_KEYBOARD</productname>
  <productid>0x07a5</productid>
</deviceproductdef>
{% endhighlight %}

The name is used to create the device limitation:

{% highlight xml %}
<device_only>
  DeviceVendor::MICROSOFT, 
  DeviceProduct::SCULPT_KEYBOARD
</device_only>
{% endhighlight %}

I need not do the samve for `MICROSOFT` because KeyRemap recognizes it natively.

## Naming the remap

The last two required elements are a name and an identifier for the remapping:

{% highlight xml %}
<name>Sculpt Remap</name>
<identifier>private.app_to_opt</identifier>
{% endhighlight %}

I don't know why the identifier is required.

## Putting it all together

Wrapping our remap rules in a **item** tag creates a remap setting in KeyRemap's user interface that can be toggled on or off:

{% highlight xml %}
<item>
  <name>Sculpt Remap</name>
  <identifier>private.app_to_opt</identifier>
  <device_only>
    DeviceVendor::MICROSOFT, 
    DeviceProduct::SCULPT_KEYBOARD
  </device_only>
  <autogen>
    __KeyToKey__
    KeyCode::PC_APPLICATION,
    KeyCode::OPTION_R
  </autogen>
</item>

<deviceproductdef>
  <productname>SCULPT_KEYBOARD</productname>
  <productid>0x07a5</productid>
</deviceproductdef>
{% endhighlight %}

## Multiple remaps

To truely make the Sculpt Ergonomic Keyboard Mac-like, 3 keys remain to be remapped. Although easily accomplished in Mac's *own* System Preferences, the task is no harder done in KeyRemap now that we have the structure set up. Merely adding 3 more `<autogen>` tags alone side the existing one does the trick.
ee
{% highlight xml %}
<autogen>
  __KeyToKey__
  KeyCode::COMMAND_L,
  KeyCode::OPTION_L
</autogen>
<autogen>
  __KeyToKey__
  KeyCode::OPTION_L,
  KeyCode::COMMAND_L
</autogen>
<autogen>
  __KeyToKey__
  KeyCode::OPTION_R,
  KeyCode::COMMAND_R
</autogen>
{% endhighlight %}

## A few more things worth mentioning

**Remapping is different from key simulations**, what you get from [Keyboard Maestro][km]. To demonstrate the difference, a simulation of hitting the "E" key will generate *one* "E", even if the trigger key is still pressed. Extra customization is required to simulate a real remap, which continuously generates "E"s as if you are really pressing the button.

[Link to KeyRemap's excellent online documentation](http://pqrs.org/macosx/keyremap4macbook/xml.html.en#replacementdef)

[Link to Amazon selling the Sculpt Ergonomic Keyboard](http://www.amazon.com/s/ref=nb_sb_ss_i_0_11?url=search-alias%3Daps&field-keywords=sculpt+ergonomic+desktop&sprefix=sculpt+ergo%2Caps%2C137)

As of Oct 30, 2013, versions with and without the mouse cost $100 and $71 respectively.

Key-pressings of the Sculpt Ergonomic Keyboard feel like those of MacBook's keyboard. For this reason I switched to the Sculpt keyboard effortlessly. 

The hand posture assumed when typing with this keyboard indeed feels natural and comfortable. However I don't know how much the ergonomics will contribute to preventing finger strains. I still think **"less typing, more walking"** is the best measurement.

[review]: http://www.marco.org/2013/08/30/sculpt-ergonomic-keyboard-review
[viewer]: https://pqrs.org/macosx/keyremap4macbook/document.html.en#eventviewer
[privatexml]: https://pqrs.org/macosx/keyremap4macbook/document.html.en#privatexml
[km]: http://www.keyboardmaestro.com/main/