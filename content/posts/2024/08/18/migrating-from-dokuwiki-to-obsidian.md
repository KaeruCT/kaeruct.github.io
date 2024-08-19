---
title: "Migrating From DokuWiki to Obsidian"
date: 2024-08-18T21:37:56+02:00
draft: false
tags:
 - obsidian
 - dokuwiki
 - refactoring
---

About a year ago, I decided to move all my personal notes from [DokuWiki](https://www.dokuwiki.org) to [Obsidian](https://obsidian.md/).

DokuWiki is great software and has served me well, but I never utilized it to its full capacity. It's biggest strength is that it's a... wiki, and I was the sole user. 

It made little sense for me to keep a service running when I could just have some Markdown files locally. And Obsidian provides a really nice UI on top of those Markdown files.

One reason I chose DokuWiki in the first place, is that it doesn't need a database. All the content is kept in plaintext files. So if I ever wanted to move my notes elsewhere, it would hopefully be a painless process. In the end, I think it was a good choice, because the migration was quite simple.

## The Migration Process

These are the steps I followed:

### 1. Copying the data folder locally

First, I needed to get the source text and image files from DokuWiki to my local machine. All of it is located at `/var/www/dokuwiki/data/` for a common installation. This directory contains all the text files and images that comprise the wiki pages. [This directory is configurable](https://www.dokuwiki.org/config:savedir), so check your configuration if you're unsure.

### 2. Convert all text files from DokuWiki Syntax to proper Markdown

The next step was to locate all the `.txt` files in `data/pages`. These files needed to be renamed to `.md`, and the content converted to proper Markdown.

DokuWiki uses its own syntax, which is not really used anywhere else.

I ended up writing a quick script to handle this, with some help from ChatGPT to speed up the process.

Main points the script covers:
 - Changing DokuWiki's heading syntax to Markdown format.
 - Adjusting link and image paths to work with Obsidian.
 - Handling any quirks like list formatting.

{{< gist KaeruCT ee37b6ef37195313de7450f1731599b6 >}}

### 3. Moving Media Files

After the text files were converted, I moved all the media files from `data/media` to `data/pages`. Obsidian can handle images and other media in the same directory as the Markdown files, which DokuWiki did not.

### 4. Final Touches

The last step was to verify everything in Obsidian. I went through my notes to check formatting and that there were no broken links or images. A few minor tweaks were necessary, but the script got me 95% of the way there!

## Conclusion

It's been about a year since I did the migration, and using Obsidian is much smoother. I just need to make sure the directory with my notes is properly backed up / synchronized between my devices. Obsidian offers this as a paid feature, but I didn't want to depend on yet another 3rd party service. I simply use a Git repository to keep my notes.

For anyone looking to do the same or similar, I hope this post helps you out.

Here is a small peek of my notes in Obsidian's beautiful graph view:

![obsidian graph view](/images/screenshots/obsidian-cloud.png)
