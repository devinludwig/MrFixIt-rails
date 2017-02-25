module ControllerMacros
  def login_worker
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:worker]
      worker = FactoryGirl.create(:worker)
      sign_in worker
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end
