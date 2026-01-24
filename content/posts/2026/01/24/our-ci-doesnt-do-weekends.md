---
title: "Our CI Doesn't Do Weekends"
date: 2026-01-24T10:34:06+01:00
draft: false
license: "CC BY 4.0"
author: "Andrés Villarreal"
tags:
  - ci
  - nodejs
  - jest
  - vitest
  - testing
---

I think a codebase can tell you a lot about the people that work on it. From this specific example in particular, I felt very reassured that the team takes work-life balance seriously and never works on weekends.

For context, the software interfaces with old-school banking systems that famously do not run certain processes on holidays or weekends.

We had some logic to to an early return to avoid running a process on bank holidays, imagine something like the following:

```js
if (isBankHoliday(new Date())) {
  logger.info("Skipping process on bank holiday");
  return;
}
// ... continue business logic below
```

This logic was not covered by any tests! Not to say that there were no tests, but they were more focused on what would happen on work days and not the fact that the code should not run on bank holidays.

This worked quite well, until somebody **pushed changes on a weekend**.

Weekends are considered bank holidays, so the check to avoid running on bank holidays was triggered and the tests failed. Fortunately, the changes being pushed on the weekend were not urgent and nobody was blocked by this.

The lesson we learned from this is that you should **not work on weekends!**

Although in all seriousness, the tests should have faked the date from the start to avoid this. Even if people are not working on weekends, it could be that they work in a different timezone, or the team needs to push an urgent hotfix during the weekend.

The way to do this using `vitest` is very simple:

```ts
// Pick a date that is definitely not a bank holiday!
vi.useFakeTimers({ now: new Date("2025-03-03"), toFake: ["Date"] });
```

By the way, [vitest](https://vitest.dev/) is very fast and [very easy to migrate to from jest](https://vitest.dev/guide/migration.html#jest)! Make the switch if you haven't already!