class PingSlackJob < ApplicationJob
  queue_as :daily_stand_up

  rescue_from ActiveJob::DeserializationError do |ex|
    Shoryuken.logger.error ex
    Shoryuken.logger.error ex.backtrace.join("\n")
  end

  def perform(report_id)
  	report = Report.find_by(id: report_id)

    msg  = "
===================
*Daily Stand-Up #{DateTimeHelper.in_malaysia_time(report.created_at)}*
===================

*A) What you've done yesterday?*
#{report.done_yesterday}

*B) What you're currently working on/try to finish today?*
#{report.doing_today}

*Are you going to do it in a small group with other developer in team? Who?*
#{report.with_group}

*Do you need your pending Pull Request(s) to be merged first for you to continue today tasks?*
#{report.pending_pr}

*C) What are the things that stopping you?*
#{report.stopping}

*Which parts that you not very clear to you?*
#{report.not_clear}

*What you need from other developer(s)?*
#{report.need_anything}

*Tell us why you still stuck at it and what you're still trying so hard to solve.*
#{report.still_stuck}"
		icon_url = GravatarHelper.url(report.user.email)
		SLACK_NOTIFIER.ping(msg, icon_url: icon_url, username: report.user.slack_username)
  end
end
