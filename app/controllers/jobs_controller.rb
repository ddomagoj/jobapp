class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index]

  def index
    @jobs = Job.find_jobs(current_user)
  end

  def show
    @application = Application.new
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = current_user.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        JobMailer.with(job: @job).new_job_email.deliver_now

        format.html { redirect_to @job, notice: "Job was successfully created, confirmation email was sent" }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @applications = Application.where(job_id: @job.id)
    @applications.each do |application|
      application.destroy
    end
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_job
      @job = Job.friendly.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :employer, :email, :category, :applications_attributes => [:first_name, :last_name, :born_on, :cv_file])
    end
end
