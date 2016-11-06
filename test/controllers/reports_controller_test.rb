require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { doing_today: @report.doing_today, done_yesterday: @report.done_yesterday, need_anything: @report.need_anything, not_clear: @report.not_clear, pending_pr: @report.pending_pr, still_stuck: @report.still_stuck, stopping: @report.stopping, user: @report.user, with_group: @report.with_group } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { doing_today: @report.doing_today, done_yesterday: @report.done_yesterday, need_anything: @report.need_anything, not_clear: @report.not_clear, pending_pr: @report.pending_pr, still_stuck: @report.still_stuck, stopping: @report.stopping, user: @report.user, with_group: @report.with_group } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
