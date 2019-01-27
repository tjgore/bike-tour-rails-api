class Api::V1::SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :update, :destroy]

  # GET /submissions
  def index
    @submissions = Submission.all

    render json: @submissions
  end

  # GET /submissions/1
=begin
  def show
    render json: @submission
  end
=end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      submission = { message: "success", submission: @submission }
      render json: submission, status: :created, location: api_v1_submission_url(@submission)
    else
      submission = { message: "failed", submission: @submission.errors }
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /submissions/1
=begin
  def update
    if @submission.update(submission_params)
      render json: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def submission_params
      params.require(:submission).permit(:first_name, :last_name, :email, :slogan)
    end
end
