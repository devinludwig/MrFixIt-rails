require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  User.delete_all
  login_user

  let(:valid_attributes) {
    {title: 'sweep', description: 'with a broom' }
  }

  let(:invalid_attributes) {
    {title: '', description: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all jobs as @jobs" do
      job = Job.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET #show" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :show, params: {id: job.to_param}, session: valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "GET #new" do
    it "assigns a new job as @job" do
      get :new, params: {}, session: valid_session
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, params: {job: valid_attributes}, session: valid_session
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, params: {job: valid_attributes}, session: valid_session
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it "redirects to the created job" do
        post :create, params: {job: valid_attributes}, session: valid_session
        expect(response).to redirect_to(jobs_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, params: {job: invalid_attributes}, session: valid_session
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, params: {job: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end


end
