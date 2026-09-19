---
title: "Conquering Entropy: Reducing Risk"
date: 2026-09-19T10:50:52+02:00
draft: false
license: "CC BY 4.0"
author: "Andrés Villarreal"
tags:
  - conquering-entropy
  - pair-programming
  - ai
  - observability
  - ci
---

>Part of "[Conquering Entropy](../05/conquering-entropy-intro.md)"

First, I have to admit some of my recommendations on this topic are based on my own experience and anecdata, and not so much backed by numbers, please take them with a grain of salt.

## Risk Management

Shipping code is risky. Any change could break the system. Over the years, I have learned to get comfortable with managing risk. For each change that I ship, I do a little risk assessment beforehand. It takes deep understanding of the system, as well as some intuition (which I fear pure vibe coders cannot reach). This is why I find it imperative to still have a clear mental model of the system I work with, even if most of the code is AI-generated. If I don't understand the system, I cannot make an accurate risk assessment.

Accurate risk assessments are useful because they can guide you to allocate just the right amount of resources for a change (mental capacity, review effort, follow-up tasks). If a change is low-risk enough, I usually just do it and ship it, no follow-up needed. If it's high-risk, I find a way to reduce the risk. Below are some strategies you can use for that.

## Scope Changes Appropriately

The way big changes are built and delivered is tied to the development process of each team. Often, it's recommended to split the tasks into smaller, deliverable chunks. This approach goes well when async work is preferred, but might make it harder to have a coherent high level understanding of the system. A proper review requires the reviewer to understand the work being done, the exact purpose of the change, and what impact it could have on the existing system. All of this must be obvious or clearly stated in the pull request (PR) description.

I'm not entirely convinced there's a change too big to be broken down into smaller, individually deliverable and reviewable chunks. However, I understand why it would be preferable to quickly get a big chunk of code into the codebase rather than splitting it and risking merge conflicts, especially if the codebase sees a lot of traffic (common in monorepos).

## Pair Programming Reborn

For big, risky changes I recommend pair or mob programming. Two or more people sit down, discuss and plan the change, scope it out, and implement it (feel free to include your coding agents here). Taking your sweet time during the planning phase can save a lot of time later on. It's worth it.

A popular way to do this is to use [Matt Pocock's grill-me skill](https://www.aihero.dev/skills-grill-me). I highly recommend it. The process encourages a shared understanding of the implementation. The team can then skip the review phase because they developed the solution together and are familiar with the code. Of course, some [trust](../06/conquering-entropy-cultivating-trust.md) is also required here.

The biggest downside of this method is that it requires multiple engineers' uninterrupted time, which might be tricky in some situations. But the benefit often outweighs the cost. The requirements are clear. There will be fewer bugs shipped and less rework, because of all the time spent planning and scoping. In my opinion, this is the most efficient way to get big, urgent changes in.

Because this method favors front-loading all the planning and scoping before writing code, it can be considered the opposite of the "ship small changes fast" approach. Therefore, it's essential that the team deliberately picks which approach they will use for each task.

Another benefit of pair programming is psychological. It's good for team building (I swear I'm not a manager!). I feel that with the use of coding agents and related tools, we engineers have become a bit more isolated. There's a stronger focus on delivering a lot of tasks. Most touchpoints with teammates are about getting a review approved, or pushing back against their agent's generated artifacts (tickets / code / documentation).

## Observability is Essential

In my first programming job, we only knew if the system had a defect because an end-user reported a bug. When I think about how far we have come, it really feels like that was the stone age. You need to know what's going on in your system! Ensure there's some sort of observability set up: Logs, metrics, traces, user telemetry, etc. Use whatever vendor you want, ideally something that's already in place. LLMs are great at consuming raw observability data and helping you debug issues, so take advantage of them!

## Choose the Right Deployment Strategy

Reducing risk is another approach which works well for both big and small changes. There are several approaches to reduce risk when releasing changes. For me, it's important to use the tools you have available already in your system. You don't have to start all fancy with Kubernetes blue/green, canary, or shadow deployments (although these can be very useful for specific situations).

Make sure your system supports a way to quickly roll back a specific change, or to turn off a feature at runtime (for example by using [feature flags](https://martinfowler.com/articles/feature-toggles.html)). If paired with proper observability, this is often good enough for most use cases.

There are some techniques currently forming around a related concept: using agents to automate releases and observability, then "babysitting" the rollouts and determining whether the system is degraded. If so, the change is automatically rolled back and a human is involved. I think this has great potential, particularly for full-on "software factory" systems. When I find the opportunity to apply this technique, I will do a follow-up post with my findings.