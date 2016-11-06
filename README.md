## Slack Daily Stand-Up

![](http://i.imgur.com/hXidFGA.gif)

[Take a closer look at the Rails app form](http://i.imgur.com/MqijkBX.png)

[Take a closer look at the Slack result](http://i.imgur.com/Dk9a7B0.png)

A simple Rails app to keep team daily stand-up records with Slack channel notification.

Using Shoryuken + AWS SQS for background job + Slack API. Markdown supported.

---

### Installation Guide

1) Clone this repo

2) To test locally first, `cd` into the folder, run `bundle install`, `rake db:migrate` and `bundle exec figaro install`

3) [Add Incoming WebHooks](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) as your Slack integrations

![](http://i.imgur.com/kYBzYCH.png)

4) Copy the Webhook URL

![](http://i.imgur.com/zmLXRSR.jpg)

5) Put it inside `config/application.yml` file

6) After that, put your AWS Access Key ID and Secret Access Key inside `config/application.yml` file

7) The best practice is to create a user and add SQS policy to that user

![](http://i.imgur.com/mufFLVr.jpg)
8) [Deploy it to Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5)

9) From your local machine terminal, run `heroku ps:scale web=1 worker=1` and `heroku run rake db:migrate`

10) That's it. You're done!

---

### Important: AWS SQS Setup

Please make sure you create 2 queues inside SQS. One is the main queue and one is for the dead/failed queue.

![](http://i.imgur.com/QufWdEc.jpg)

Put `3` inside `Maximum Receives`. This means that, if Shoryuken failed to perform the job for 3 times (ie: record not found), the job will be moved from main queue to dead queue.

![](http://i.imgur.com/UR5PRwM.jpg)

---

### Issue: Push Rejected?

Easy. Just add these variables inside your Heroku App Settings > Config Variables and push again.

![](http://i.imgur.com/eoxUBwY.jpg)

---

### Contribute

Feel free to fork this repo and submit your pull request. :muscle:

[Follow me on Twitter](http://twitter.com/zulhhandyplast)
