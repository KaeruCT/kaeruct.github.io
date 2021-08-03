<!--
.. title: Publishing an App on F-Droid
.. slug: publishing-an-app-on-f-droid
.. date: 2021-08-03 21:29:13 UTC+06:00
.. tags: android, f-droid, tips, tutorials
.. link:
.. description:
.. type: text
-->

[![F-Droid](/fdroid.svg)](https://f-droid.org/)

I made [some](https://f-droid.org/packages/com.kaeruct.raumballer/) [small](https://f-droid.org/packages/com.kaeruct.gotosleep/) [apps](https://f-droid.org/packages/com.kaeruct.glxy/) for Android and I wanted to distribute them. I also care a lot about software freedom, so F-Droid is the best place for me to publish my apps.

> Disclaimer!
> You are not able to sell your app on F-Droid. If you want to make money with it, you would need to allow users to pay through another method. Please see this [StackExchange question](https://opensource.stackexchange.com/questions/88/how-can-free-and-open-source-projects-be-monetized) if you're interested in monetization.

# What's F-Droid?

F-Droid is an alternative for the Play Store and other Android stores focused on software freedom and privacy.

The biggest difference is that F-Droid only allows [Free and Open Source (FOSS) software](https://www.gnu.org/philosophy/free-sw.en.html). F-Droid also respects your privacy and discourages application which do not.

In an age where privacy and software freedom matters most, F-Droid is the perfect replacement for other Android stores.

# Why publish on F-Droid?

F-Droid is a great way of distributing your FOSS Android application. It makes it very easy for your users to install your app and keep it up to date, without requiring them to side-load it.

There is also a higher level of trust since every apk published on F-Droid is built from source.

# How to submit your app to F-Droid

I've broken this down into two big steps:

- **Preparing** your app
- **Submitting** it to F-Droid

## Preparing your app's repo

F-Droid needs some metadata about your app so it can show something to the users. For example: app name, description, screenshots, and the changelog.

Makes sure you have good screenshots and good explanatory texts about your app. This makes people more interested in it, and speeds up the review process.

The best way to get this metadata to F-Droid is to put it in your app's repo. You only need to create a few files, following either of these methods. I recommend Fastlane.

- [Fastlane](https://gitlab.com/-/snippets/1895688)
- [Triple-T](https://gitlab.com/-/snippets/1901490)

## Submitting your app's build metadata to F-Droid

Getting your app on F-Droid is as easy as sending them a merge request to their [data repo](https://gitlab.com/fdroid/fdroiddata).

To summarize, you need to:

1. Fork the repo on GitLab
2. Create a new branch for your changes
3. Create a metadata `.yml` file for your app. You should name it using your app's id, for example: `com.kaeruct.raumballer.yml`. There are some templates [here](https://gitlab.com/fdroid/wiki/-/wikis/Metadata/YAML-Metadata).
4. Submit the merge request to [F-Droid's data repo](https://gitlab.com/fdroid/fdroiddata).
5. Wait for the automated build to finish.
6. Fix any errors in the build or feedback to your merge request.

There are details instructions in the repo's [CONTRIBUTING.md](https://gitlab.com/fdroid/fdroiddata/-/blob/master/CONTRIBUTING.md) file.

I highly recommend you also set up auto updates. This allows F-Droid to automatically know when you have released a new version. It will then update your app's metadata `.yml` file automatically and publish the new version of your app on the store.

## My experience

Each of the apps I submitted were approved around 2 or 3 weeks, but this may vary depending on the complexity of your app. The contributors are very friendly and always give you helpful feedback to get your app on F-Droid as soon as possible.

[Here is one of my app's metadata file on the F-Droid data repo](https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.kaeruct.raumballer.yml) and [the source code on GitHub](https://github.com/KaeruCT/RaumBaller).

## Closing words

F-Droid is a very valuable resource for people who care about software freedom and privacy. It is also run by volunteers. Please [donate](https://f-droid.org/en/donate/) if you are able to!
