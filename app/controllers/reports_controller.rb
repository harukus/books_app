class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    follow_users = current_user.following_ids.push(current_user.id)
    @reports = Report.where(user_id: follow_users).page(params[:page])
  end

  def show
    @comment = @report.comments.new
    @comments = @report.comments.all
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to @report, notice: t(:create)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t(:update)
    else
      render :edit
    end
  end

  def destroy
    if @report.destroy
      redirect_to reports_url, notice: t(:destroy)
    else
      render :show
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
