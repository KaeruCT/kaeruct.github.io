---
title: "Starfield visualization in JavaScript"
date: 2024-08-31T20:18:07+02:00
draft: false
tags:
  - tutorials
  - javascript
  - programming-projects
  - canvas
---

This is a simple, straightforward implementation of a visualization reminiscent of the classic Windows 95 starfield screensaver.

It is also interactive: you can touch the screen or use the accelerometer to influence the direction of the movement.

This is how it works:
- Create a bunch of particles (100), each in a random position.
- Every frame, move each particle further away from *the center**. The further the particle is from the center, the more visible it will become. This gives the illusion that the particles are moving closer to the viewer, or that the viewer is going further into space.
- *The center* is not really the center of the screen, but a variable point which can be influenced by the user by moving their cursor or tilting their device.
- When the particles go outside of the view, put them near the center again, this keeps the visualization going on in perpetuity.

In this blog post, I want to share the heavily-commented source code to demonstrate how simple it is to create visually appealing animations with a few lines of code and basic math knowledge.

The visualization is embedded in an iframe below, but you can also [click here](/projects/starfield/) to see it in its own page.

<iframe src="/projects/starfield/" width="100%" height="256px"></iframe>

The code is available in this Gist:

{{< gist KaeruCT 2710cf4f92cd030b44dea80ec0a04996 >}}