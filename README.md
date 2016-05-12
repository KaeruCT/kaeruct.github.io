nikola-blog
===========

blog made with nikola

See https://getnikola.com/getting-started.html

## new posts, deploy
to add new posts and deploy, do this:

    $ source ~/.virtualenvs/nikola/bin/activate
    $ git checkout deploy # make sure you're on deploy branch
    $ nikola new_post # use nikola to create new post
    $ nikola build && nikola serve # preview post locally
    $ git commit ... 'new post' # when you're done, commit
    $ git push origin deploy
    $ nikola github_deploy # then deploy with nikola
