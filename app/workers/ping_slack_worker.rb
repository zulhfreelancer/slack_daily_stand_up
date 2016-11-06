# we're not using Shoryuken Worker - we're using ActiveJob instead
# Shoryuken tutorial - http://alex.aspria.net/using-shoryuken-amazon-sqs-with-rails.html

# class PingSlackWorker
#   include Shoryuken::Worker

#   shoryuken_options queue: "daily_stand_up", auto_delete: true, body_parser: :json

#   def perform(sqs_msg, data)
#     report = Report.find_by(id: data["report_id"])

#     msg  = "
# ===================
# *Daily Stand-Up #{DateTimeHelper.in_malaysia_time(report.created_at)}*
# ===================

# *A) What you've done yesterday?*
# #{report.done_yesterday}

# *B) What you're currently working on/try to finish today?*
# #{report.doing_today}

# *Are you going to do it in a small group with other developer in team? Who?*
# #{report.with_group}

# *Do you need your pending Pull Request(s) to be merged first for you to continue today tasks?*
# #{report.pending_pr}

# *C) What are the things that stopping you?*
# #{report.stopping}

# *Which parts that you not very clear to you?*
# #{report.not_clear}

# *What you need from other developer(s)?*
# #{report.need_anything}

# *Tell us why you still stuck at it and what you're still trying so hard to solve.*
# #{report.still_stuck}"
#     icon_url = GravatarHelper.url(report.user.email)
#     SLACK_NOTIFIER.ping(msg, icon_url: icon_url, username: report.user.slack_username)
#   end
# end
