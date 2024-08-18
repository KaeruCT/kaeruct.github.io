---
title: "How to use the Youtube JS API to play music in the background"
date: 2014-05-23T18:29:55+00:00
description: ""
draft: false
tags:
 - tutorials
 - youtube
 - javascript
image: ""
aliases:
  - /posts/how-to-use-the-youtube-js-api-to-play-music-in-the-background.html
---

The Youtube JavaScript API allows you to embed YouTube videos and
interact with them programatically. To use it, first you need to embed this
script into your page:

`<script src="http://www.youtube.com/player_api"></script>`.

If you just want the audio, you can hide the element that contains the video:

`<div id="player" style="position: absolute; top: -9999px; left: -9999px;"></div>`

Here we use absolute positioning with negative coordinates
because using `display: none;` will prevent the `onReady` handler
from the Youtube player from triggering on Firefox. I ran across this problem
when making [this](http://kaeru.neritic.net/projects/short-experiments/walk).

Finally, here's [a full example](/examples/yt-js-api) that will wait for the video to
load and automatically play it:

{{< gist KaeruCT dcfae82a15af514ea95e >}}