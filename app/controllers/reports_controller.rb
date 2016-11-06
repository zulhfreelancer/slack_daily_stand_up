class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update]

  def index
    @reports = current_user.reports.all.order(id: :desc).paginate(page: params[:page])
  end

  def show
  end

  def new
    @report = current_user.reports.new
  end

  def edit
  end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to reports_path, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to reports_path, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:done_yesterday, :doing_today, :with_group, :pending_pr, :stopping, :not_clear, :need_anything, :still_stuck)
    end
end
