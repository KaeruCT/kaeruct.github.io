---
title: "Rainbow Tunnel"
date: 2013-03-07T00:00:00+00:00
description: ""
draft: false
tags:
 - programming-projects
 - fun
 - javascript
 - canvas
image: ""
aliases:
  - /posts/rainbow-tunnel.html
---

Today I had some more time to code something fun, so I decided to make a tunnel
of sorts.

The trick is really simple, first you just draw rings around the center of the page,
and tweak their position a bit depending on the position of the mouse.

To achieve the rainbow effect, you just have to make it so each ring has its hue value
a little higher than the ring before it, and increase all of the rings' hues each frame.

I did it a little different than that, I have a base hue, which I increase every frame,
and then when each ring gets drawn, it uses the base hue plus a small increment
(which you can control with the mouse wheel).

I guess this is a bit trippy? [See it full-screen here](/projects/tunnel).

<a href="/projects/tunnel"><iframe src="/projects/tunnel/"></a>
