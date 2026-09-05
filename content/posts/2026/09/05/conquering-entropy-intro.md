---
title: "Conquering Entropy"
date: 2026-09-05T22:44:19+02:00
draft: false
license: "CC BY 4.0"
author: "Andrés Villarreal"
tags:
  - conquering-entropy
  - ai
---

A collection of ideas on how to manage entropy in codebases inundated with AI-generated code and survive in the process.

## What's Been Changing

Ever since coding agents became popular, my company's monorepo line count has exploded. The number of pull requests (PR) has roughly doubled (conservatively), and so has the review burden on all engineers. People think the biggest problem now is that there's too much code to review. But there's way worse stuff!

Other negative consequences I have noticed:

- Degraded shared understanding of the system, since most code is not written by hand anymore. We are missing this step, which helped us solidify our comprehension of the system and strengthen our mental models.
- Artifacts which are difficult to understand. For example, tickets heavily written by AI, system design documents, code comments and documentation. This is due to the way LLMs write. People are calling this new language "Claudish" and I hate it because it muddles communication.
- Jumping to conclusions too fast. As difficult as the LLM output can be to understand, sometimes it can be very convincing and people let their guard down and easily trust it. I think we need to "trust but verify" even harder nowadays.

I see a lot of anxiety and worry over what the profession is becoming. This one's tricky and I'm afraid I don't have any useful actions to help with this. Personally I have chosen to take advantage of the current tools and focus on maintaining a system that I can be proud of. But in a few years we might not even need humans for this.

## AI Contributions Are Staying

In some open source projects (like Zig, NetBSD, GIMP or QEMU), [AI contributions have been banned](https://arxiv.org/abs/2603.26487). Reasons vary, but I see a common thread: lack of trust. Slop, spam, untrusted code, no accountability, licensing.

Within a company, it's not often feasible to ban AI contributions, as the business also expects that the engineers deliver at an accelerated pace. And the incentive within a company is usually to deliver more, show higher performance, get your promotion, salary increase, etc. So as long as there's a tool that improves productivity (or looks like it does), people will use it.

I used to think that if AI usage kept incurring higher and higher costs, it would collapse and everyone would go back to writing code by hand. But I don't think this will happen anymore. There's many "good enough" open models that can be self-hosted right now, and they're only going to get better. [Some companies are already experimenting with this](https://archive.is/kmOqm) to reduce their dependency on the big AI providers.

So it looks like AI usage will not stop. I like it (societal and economical consequences aside). It's allowed me to have a greater impact that I could have had before by doing a lot of the grunt work that is necessary but I never had the time for. Also allowed me to get so much more done on my side projects in which code quality is not the focus. It's also fun to tinker with. I have tried many different setups and enjoy discussing these with my colleagues.
