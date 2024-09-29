---
title: "Using AsyncLocalStorage for Better Traceability in NodeJS Applications"
date: 2024-09-29T10:45:54+02:00
draft: false
---


NodeJS has a neat API called `AsyncLocalStorage`. It's used to share information across callbacks and promise chains.

For example, it is useful to share information for all the code executed when serving a web request. I also found it very useful to keep trace information to easily keep track of which item was being processed during a batch process.

The only caveat in my opinion, is that you need to wrap your code in yet another callback.

## How to use `AsyncLocalStorage`:

1. First, create an instance of `AsyncLocalStorage`:
    
    ```js
    const asyncLocalStorage = new AsyncLocalStorage();
    ````

2. Then, use the `run` method to wrap your code:
    
    ```js
    const sharedState = { hello: "world" };
    await asyncLocalStorage.run(sharedState, async () => {
      await foo();
    });
    ```

3. Finally, use the `getStore` method to retrieve the shared state:
    
    ```js
    async function foo() {
      const sharedState = asyncLocalStorage.getStore();
      console.log(sharedState);
    }
    ```

    The output will be:
    ```
    { hello: "world" }
    ```

## Real-world example

The previous example is very simple because it only shows how to use it.

Here's a more elaborate example that will hopefully show why this feature is so useful:

```js
import { AsyncLocalStorage } = from "node:async_hooks";

async function process() {
  try {
    await Promise.all([foo(), bar()]);
  } catch (err) {
    handleError(err);
  }
}

async function foo() {
  const { index } = asyncLocalStorage.getStore();
  console.log(`processing foo ${index}`);
}

async function bar() {
  const { index } = asyncLocalStorage.getStore();
  console.log(`processing bar ${index}`);
  
  if (Math.random() < 0.1) {
    // simulate a random failure
    throw new Error("A random failure happened");
  }
}

async function handleError(err) {
  const { index } = asyncLocalStorage.getStore();
  console.log(`Handling error when processing ${index}: ${err}`);
}

const asyncLocalStorage = new AsyncLocalStorage();

// process 20 things, asynchronously
const tasks = [];
for (let i = 0; i < 20; i++) {
  tasks.push(
    asyncLocalStorage.run({ index: i }, process)
  );
}
```

If you execute this code, it will clearly log for which items the failures occured, because the required information is available in the shared state exposed by `AsyncLocalStorage`.

Example of the output:

```text
processing foo 0
processing bar 0
processing foo 1
processing bar 1
...
Handling error when processing 3: Error: A random failure happened
Handling error when processing 8: Error: A random failure happened
Handling error when processing 14: Error: A random failure happened
```