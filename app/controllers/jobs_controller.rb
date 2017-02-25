class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to jobs_path
      flash[:notice] = 'Job was successfully saved!'
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(pending: true, worker_id: current_worker.id)
        respond_to do |format|
          format.html { redirect_to worker_path(current_worker) }
          format.js
        end
        flash[:notice] = "You've successfully claimed this job."
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      flash[:notice] = 'You must have a worker account to claim a job. Please register below!'
      redirect_to new_worker_registration_path
    end
  end

  def update_progress
    @job = Job.find(params[:id])
    if @job.update(in_progress: true)
      respond_to do |format|
        format.html { redirect_to worker_path(current_worker) }
        format.js
      end
      flash[:notice] = "Job marked 'in progress'."
    else
      redirect_to worker_path(current_worker)
      flash[:notice] = "Something went wrong!"
    end
  end

  def complete
    @job = Job.find(params[:id])
    if @job.update(completed: true, in_progress: false)
      respond_to do |format|
        format.html { redirect_to worker_path(current_worker) }
        format.js
      end
      flash[:notice] = "Job marked Complete!"
    else
      redirect_to worker_path(current_worker)
      flash[:notice] = "Something went wrong!"
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
