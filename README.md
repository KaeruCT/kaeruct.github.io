nikola-blog
===========

blog made with nikola

See https://getnikola.com/getting-started.html

## new posts, deploy
to add new posts and deploy, do this:

    $ source ~/.virtualenvs/nikola/bin/activate
    $ git checkout deploy # make sure you're on deploy branch
    $ git pull # make sure you have the latest version
    $ nikola new_post # use nikola to create new post
    $ nikola auto --browser # preview post locally
    $ nikola build # when you're done, build
    $ git commit ... 'new post' # then commit
    $ git push origin deploy
    $ nikola github_deploy # then deploy with nikola
