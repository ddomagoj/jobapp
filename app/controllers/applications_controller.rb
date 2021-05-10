class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[ show edit update destroy new ]
  before_action :authenticate_user!, except:[]

  
  def index
    @applications = Application.user_applications(current_user)
  end

  def show
  end

  def new
    @application = Application.new
  end

  def edit
  end

  def create
    @application = current_user.applications.new(application_params)

    respond_to do |format|
      if @application.save
        ApplicationMailer.with(application: @application).new_application_email.deliver_now
        ApplicationMailer.with(application: @application).new_application_email2.deliver_now

        format.html { redirect_to @application, notice: "Application was successfully created, and confirmation email sent." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_application
      @application = Application.friendly.find(params[:id])
    end

    def application_params
      
      params.require(:application).permit(:first_name, :last_name, :born_on, :email, :phone, :address, :education, :cv_file, :job_id)
    end
end
