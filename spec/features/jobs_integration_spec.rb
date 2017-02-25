require 'rails_helper'

RSpec.describe "the job path", type: :feature do
  before {
    User.delete_all
    user = FactoryGirl.create(:user)
    sign_in user
  }

  it "displays the new job form when a user clicks the new job button" do
    visit(root_path)
    click_link('Add Your Job')
    expect(page).to have_content('Post your Job Title Description')
  end

  it "creates a new job when a user submits the form" do
    visit(new_job_path)
    fill_in'job_title', :with => 'beat on the brat'
    fill_in 'job_description', :with => 'with a baseball bat'
    click_on 'Create Job'
    expect(page).to have_content 'Job was successfully saved! Jobs: beat on the brat'
  end

  it "displays the show job page when user clicks on a job from the job index" do
    FactoryGirl.create(:job)
    visit(jobs_path)
    click_link('beat on the brat')
    expect(page).to have_content 'No one has claimed this job! click here to claim it now'
  end

  it "assigns job to worker when worker click on link to claim it" do
    FactoryGirl.create(:job)
    worker = FactoryGirl.create(:worker)
    sign_in worker
    visit('/jobs/1')
    click_on('click here to claim it now')
    expect(page).to have_content "You've successfully claimed this job."
  end

  it "moves a worker's job from the pending column to the 'in progress' column if the worker marks it such" do
    job = FactoryGirl.create(:job)
    worker = FactoryGirl.create(:worker)
    sign_in worker
    worker.jobs.push(job)
    visit(worker_path(worker))
    click_on "Mark as 'in progress'"
    expect(page).to have_content "In Progress: #{job.title} Complete"
  end

  it "moves a worker's job from the 'in progress' column to the 'completed' column if the worker marks it such" do
    job = FactoryGirl.create(:job)
    worker = FactoryGirl.create(:worker)
    sign_in worker
    worker.jobs.push(job)
    visit(worker_path(worker))
    click_on "Mark as 'in progress'"
    click_on "Complete"
    expect(page).to have_content "Completed: #{job.title}"
  end
end
