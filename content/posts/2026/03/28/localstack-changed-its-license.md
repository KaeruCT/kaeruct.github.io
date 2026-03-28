---
title: "LocalStack License Changed, CI First to Know"
date: 2026-03-28T16:09:45+01:00
draft: false
license: "CC BY 4.0"
author: "Andrés Villarreal"
tags:
  - ci
  - testing
  - tips
  - ramblings
---

[LocalStack](https://www.localstack.cloud/) is a great product. It's basically an emulator for the AWS cloud that you can run locally. We rely on it for development and automated testing. However, nothing comes for free. Understandably, the company behind this amazing piece of software has some bills to pay. They changed the license to require a subscription to run their provided Docker images. If the license is not provided as an environment variable, the image simply fails to start. Normally, this would not be a problem if we pinned our versions properly. But surprise, we don't!

CI started "randomly" failing in the middle of the day and annoying all the engineers. I consider myself the self-appointed CI shepherd, so it was my responsibility to find out what was going on. Initially I thought this was just a couple of flaky tests, but after it started failing constantly, it became obvious we had a real problem. We use [testcontainers](https://testcontainers.com/) with the S3 LocalStack image, and all tests which used this setup were consistently failing.
 
The nice thing is that I was able to reproduce the problem locally, so then I just bumped the log levels to the max and looked for funny stuff. After some log spelunking, I noticed the failing image was `localstack/localstack:s3-latest`. From there it was easy to find out [LocalStack's latest blog post](https://blog.localstack.cloud/localstack-for-aws-release-2026-03-0/#setting-your-auth-token) explaining their licensing changes.

The immediate fix was to pin the image to version `4.4.0`. For example: change `localstack/localstack:s3-latest` to `localstack/localstack:4.4.0`.

I would say the main takeaway from all of this is to pin your versions. Then you always know what you get. Package manager dependencies, docker images, Github actions, anything! Always specify a deterministic version. Never use `latest` or similar. Oh, how I wish [reproducible builds](https://reproducible-builds.org/) were more widespread in the software industry!

Back to the LocalStack topic, now I am actively on the lookout for a proper replacement. I only need a local S3-compatible emulator. I have tried MinIO but for some reason it doesn't seem to be a drop-in replacement and also has some funny business going on with the licensing. [floci](https://github.com/hectorvent/floci) also seems promising although it's quite new. Please reach out if you have any recommendations!