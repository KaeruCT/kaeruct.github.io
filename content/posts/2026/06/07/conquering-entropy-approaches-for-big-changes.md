---
title: 'Conquering Entropy: Approaches for "Big Changes"'
date: 2026-06-07T09:53:52+02:00
draft: true
license: "CC BY 4.0"
author: "Andrés Villarreal"
tags:
  - conquering-entropy
  - pair-programming
  - ai
---

This is tied to the development process of the team. Often, it's recommended to split the tasks into smaller, deliverable chunks. This approach goes well when async work is preferred, but might make it harder to have a coherent high level understanding of the system. In my experience, a proper review necessitates that the reviewer understand the work being done, the exact purpose of the change, and what impact it could have on the existing system. All of this must be obvious or clearly stated in the PR description.

I'm not entirely convinced there's a change too big to be broken down into smaller, individually deliverable and reviewable chunks. However, I understand why it would preferable to quickly get in a big chunk of code into the codebase rather than splitting it and risking merge conflicts, specially if the codebase sees a lot of traffic (common in monorepos).

For these situations I recommend pair or mob programming. Two or more people sit down, discuss and plan the change, scope it out, and implement it. All of this can be done including a coding agent as well. This process encourages the shared understanding of the implementation. The team can then skip the review phase because they developed the solution together and are familiar with the code. However, this requires multiple engineers' uninterrupted time, which might be tricky in some situations. In my opinion it's the most efficient way to get big, urgent changes in.
