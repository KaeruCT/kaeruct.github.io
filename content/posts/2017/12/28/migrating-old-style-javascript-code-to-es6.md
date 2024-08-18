---
title: "Migrating old-style JavaScript code to ES6"
date: 2017-12-28T00:00:00+00:00
description: ""
draft: false
tags:
 - javascript
 - refactoring
 - es6
 - webpack
image: ""
aliases:
  - /posts/migrating-old-style-javascript-code-to-es6.html
---

Recently (at work) I had to migrate a medium-sized JavaScript codebase (20KLOC) to [ES6](https://github.com/lukehoban/es6features).

We wanted to migrate to take advantage of the new features such as arrow functions, destructuring, and classes (there are a bunch more!).
Additionally, I was tasked with introducing [eslint](https://eslint.org/) and [prettier](https://prettier.io/) to improve the quality of our code a bit more.

>Before diving into the migration process, first I'd like to give some context on the state of the application.

>We already used [npm](https://www.npmjs.com/) and [webpack](https://webpack.js.org/) to build our frontend, so I thought the migration should be straightforward -- and it was.

>I was heavily involved in modifying our build process to use npm instead of ad-hoc shell scripts, and I found [this guide](https://www.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/) to be incredibly helpful.

Back to the migration, the first thing I did was to add babel to webpack using [babel-loader](https://github.com/babel/babel-loader).
It was easy to add to webpack and took almost no time to set up.
This meant that webpack would take our JavaScript files and transpile them from ES6 to "normal" JavaScript that all browsers can run.
However, in order to get our mocha tests running, it was necessary to hook
babel into our tests as well. I used [this guide](https://istanbul.js.org/docs/tutorials/es2015/) from istanbul and was able to get them running fairly quickly.

Once I ran the build and the tests and everything looked good, then it was time to really port our code to ES6.
First, it was necessary to port some code that was using the [module pattern](http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html) to ES6 module syntax. I did this manually (using search/replace tools) and it took me a few hours.

In some cases we had some ugly dependencies on globals so a bit of refactoring was required.
In cases where it wasn't possible, webpack has the [ProvidePlugin](https://webpack.js.org/plugins/provide-plugin/), which covers most cases.
I also found the [expose-loader](https://github.com/webpack-contrib/expose-loader) to be useful becase we have some code not under our control that required jQuery to be a browser global.

Once that was done, it was time to get started with the syntax changes.
I found an amazing tool for that, [Lebab](https://lebab.io/). It is a very realiable tool and I would totally use it again.
I ran all the "safe" transformations, verified them, and then ran some of the "unsafe" ones, checking how the code changed each time.

Finally, I ran the build and our mocha tests to make sure they still passed.
The tests broke in a few places because of things like variables being shadowed because of the changes from `var` to `let` or `const`.

However, with the help of the [no-shadow](https://eslint.org/docs/rules/no-shadow) eslint rule, I was able to find all those cases quickly and get them fixed. ESLint was also very helpful in making sure I was not breaking any code with the refactoring I had to do.

The lines of code initially went down because of the ES6 syntax sugar, but they went back up with the introduction of prettier and its opinionated formatting -- especially regarding line length.

In the end, the migration was not as terrible as I initially thought it would be, and now it's a bit more enjoyable to work on that codebase.