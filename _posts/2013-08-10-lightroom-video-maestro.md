---
layout: post
title: Make Lightroom do video with Keyboard Maestro
sub: user-interface automation

---

# Make Lightroom do video with Keyboard Maestro

COLOR CORRECTING VIDEO in [Lightroom][prolost-presets] had always been delightful but impractical. While I can export a hero frame from each video clip for adjustment in Lightroom, to later **copy & paste** the adjustment onto the entire clip is an unimaginable labor of mouse clicks. Luckily this is where [Keyboard Maestro][km] shines: user interface manipulation, with *loop-ability*.

I need to create for each clip I have a smart collection with a "**filename contains**" filter (e.g. `3791`). That way when I import the clips in the form of **sequences of images**, they will be grouped with their respective hero frames. Keyboard Maestro can make these collections easily with a **loop**.

## the "Loop" macro

+ **for** each ***line*** in the **clipboard**[^4] do the following:
    1. Execute macro **New Smart Collection**
    2. Execute macro **Sync Edits**

the clipboard ***line***, which is one of the clip numbers, will be stored inside a **variable**, for use in the first macro executed by the **loop** macro.

## the "New Smart Collection" macro

1. Simulate keyboard shortcut for **New Smart Collection**[^1]
2. Navigate to the **filename contains** field with a series of **tabs**
3. Type out the stored **variable**

Immediately after the creation of a smart collection, a "hero frame & image sequence" group will be presented in the interface -- perfect chance to synchronize edits.

## the "Synchronise Edits" macro

1. execute **Select All** from menu[^2]
2. execute **Sync Settings...** from menu

The sequence of images now have the same adjustment settings as the hero frame. Keyboard Maestro will now do another round of actions based on the next line in the clipboard.  

[^4]: Example clipboard:
    <pre>3788
    3791
    3810
    3815
    3816</pre>

    I created this list with a Ruby script that extracts 4-digit numbers from my hero frames.

[^1]: The menu that contains **New Smart Collection** isn't accessible from Keyboard Maestro's "select menu command" action.

[^2]: A Keyboard Maestro 6 feature, directly select from a menu.



[prolost-presets]: http://prolost.com/blog/2013/7/10/prolost-presets-for-lightroom.html
[bmcc-cc]: http://vimeo.com/47992323q
[km]: http://www.keyboardmaestro.com/main/
[c21]: http://vimeo.com/69647902






