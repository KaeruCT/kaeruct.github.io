---
title: "My top tips for junior developers"
date: 2020-04-18T00:00:00+00:00
description: ""
draft: false
tags:
 - tips
 - career
 - mentoring
image: ""
aliases:
  - /posts/my-top-tips-for-junior-developers.html
---

Last year, I was tasked with mentoring an intern. It wasn't my first time mentoring, but it was my first time being fully in charge of a new employee. In the end, the intern was hired as a full-time employee, and I thought it would be helpful to compile all the advice I've been giving them, for future reference.

The following tips come from my experience and my way of working, as well as my own personal opinions.


# Tip 1: Learn how to search effectively 

Knowing what to search and how to search is an essential skill.
Usually, I don't remember or know most of the things my colleagues ask me. Yet, after 5 minutes I can usually figure it out or at least point them in the right direction. All thanks to the power of search.

## How to search

As with most things in life, Google will probably have an answer for you. Make sure to type it in a way that makes sense for Google. For example, if you have an error, copy-paste it word-for-word and put it inside double (") quotes. This might take you to Github issues, Stack Overflow answers, or blogs like this one!

If you don't find anything, try different variations of your search. You can try removing specifics (line numbers are often useless, and also data values). For example, if you get an error like this:

```
TypeError [ERR_INVALID_ARG_TYPE]: The "msecs" argument must be of type number. Received type string
    at validateNumber (internal/validators.js:130:11)
    at validateTimerDuration (internal/timers.js:146:3)
    at ClientRequest.setTimeout (_http_client.js:735:11)
    ...
```

You could be searching the following instead:

```
TypeError [ERR_INVALID_ARG_TYPE]: The "msecs" argument must be of type number. Received type string
```

If that's still too long, you can try only
```
The "msecs" argument must be of type number
```

If you still can't find anything useful, take advantage of your company's resources. Try the same search on your company's internal systems. Try everything: Slack, bug tracker (e.g.: JIRA), wiki, emails, Google Docs. If you still don't find anything, try reaching out to your more senior colleagues. They will surely know how to help or at least point you in the right direction.

## How to navigate codebases

Sometimes your search will guide you to the source code that is throwing the error you were searching for. This is a bit sad since it means probably no one has found a solution yet for the problem you're having. In these cases you will need to read the code you found and try to understand it.

I think the best way to understand code is to see the flow of the data in the code. For example, let's say you have an app that let's you search movies by actor name.

I would first try to understand where the movie data is coming from. An external API? A database? A file?

Then I would see what happens when I type "Nicolas Cage" into the search box and click "Search". Does the app do an external network request? Is the data already available locally? If I search "Search" in the source code, will I be able to find the code for the button that triggers the search?

I would keep asking myself questions and answering them, until I have a better understanding of where the data is going to and coming from.

## How to deal with Github issues

You might get lucky and find someone that had the same issue and opened a Github issue for it. If you're even luckier, someone else (or the original reporter) might have found a solution and shared it there. Then, the repository's maintainers may have merged the solution. Or maybe not yet.

If you don't want to wait for the repository's maintainers to merge the fix, there's always the option of forking the repository and merging the fix yourself. This is usually not a good idea unless you need this fix very urgently, since your fork will quickly become outdated. It's up to you and/or your team to decide if this is worth the risks.

# Tip 2: Don't copy-paste code without understanding it

I have noticed way too many junior developers copy & paste code without understanding what it's doing. I've been guilty of this as well but I don't remember it, maybe because I rely on copy-pasting so much!

The problem with this: it can cause unintended consequences. If the copy-pasted code breaks you will not know how to fix it since you didn't understand it in the first place. This means sooner or later you will have to come back to this code and understand it.

If you are doing unit testing (which you should), you will need to understand the code first, to be able to write tests for it. You will need to identify every execution path it might take and think about the inputs that might break it. 

One thing that has worked for me is to avoid copy-pasting the code and try to write it on my own. [Grok](https://wiki.c2.com/?ToGrok) what the code is doing and writing it using variable/function/class names that match your project and business logic. Once you have done this you might understand it a bit better.

# Tip 3: Know your tools

With tools, I mean everything that helps you get your work done. A few examples:

Shell, text editor, IDE, compiler, package manager, version control, CI/CD (continuous integration/continuous delivery).

Notice I am using the generic terms and not the specific tools you or your company might be using. Why is that? Because you should be able to pick up tools and work with them.

To have a good productivity, you need to become familiar with the tools used by your colleagues, so make sure to ask around for recommendations.

In some cases you will need to use tools that you don't necessarily enjoy using, and that's okay. Tools are a means to an end. Tools should help you build your final product. They should not be your main focus - unless you work for a software company that builds software development tools.

Here are some of my favorite tools at the moment:

* Bash
* Visual Studio Code
* IntelliJ IDEA
* yarn
* Git
* Gitlab CI

Why are they my favorite tools? Because I'm used to them. Only looking at them, many developers will know I am primarily a frontend developer. There's always going to be something better and everyone has different preferences. But it doesn't matter, as long as the tools help you get the job done. Still, always be open to new tools and ask other people why they chose theirs. They might change your mind and you will become even more productive! A good way to quickly get to know a tool is to do a search like this: "&lt;tool&gt; tips and tricks".

## Know your programming language(s)

It's also very important to know all the fundamental concepts of the programming language(s) you are using at work. Again, make sure to ask your more experienced colleagues for recommendations. There are tons of books, online courses, and tutorials for every mainstream programming language out there.

You need to be fluent in your language. This will allow you to focus on solving the business problems instead of fighting against the language to make the code work. You don't have to be an expert immediately, it will take time. But make sure to keep learning and aim to become an expert in the language within the first two years of your career.
# Tip 4: Know how and when to ask for help

When you are new, you will have a lot of questions, and that's okay. Asking questions is how we learn.

## Ask yourself first

Before you ask the question to someone else, ask it to yourself. Then try to come up with a few guesses and try to validate them. This will lead to more and more questions.

This helps you understand what you really need to know to solve the problem, and when you go to someone else you will have a much better question to ask. Good questions breed good answers.

For example, let's say you have to change the `href` of a link in the footer of your company's website.
I would ask myself: "where is the code for this link?"

Then I would come up with a few hypotheses:

* I can find it if I search for the current `href` on the codebase.
* If I change it here and deploy the code, the link will change.

After that, I would try to prove my first hypothesis by searching for the current `href`.
Let's say I could not find it in the code. Then I would come up with a different hypothesis:

* It is not in the code, so the content must come from somewhere else.

Then I would ask myself more questions:

* Where is the content for the footer stored?
* How can I change it?

Once I have these questions, I can go to a more experienced colleague, and they will be able to quickly point me in the right direction: "Oh, that content is stored in our content management system. I will show you how to change it".

If I had  asked them my first question instead: "where is the code for this link", they would have given me a very simple answer that would take me straight to the code and that would have not been as helpful.

## Fighting forgetfulness

I am very forgetful, so I like to keep notes. Whenever I find the answer to a an important question, I make sure to write it down somewhere. This has several benefits:

* You don't need to remember everything.
* You can share your notes with others (this is usually called documentation).
* You can easily keep track of how much you have learned over time.

You can keep your notes on paper or digitally. Make sure to try both and see what works best for you.

# Tip 5: Maintain a healthy work-life balance

When you're starting out you always want to keep learning more and more while also delivering your work. This means you will probably work many hours a day if you're very passionate. This is fine if you are enjoying yourself, but you should be careful and aware of [burn out](https://en.wikipedia.org/wiki/Occupational_burnout). A good way to avoid this is to have a routine you follow every work day, and make sure you have enough breaks throughout the day. In the end it all comes down to a matter of discipline and knowing yourself.

Remember life is about living, not about working! It's a good idea to have other things outside going on in your life aside from work. There's no right or wrong here because it depends on you, but make sure you manage your stress in a healthy way.