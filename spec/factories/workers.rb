FactoryGirl.define do
  factory :worker, class:Worker do
    username "worker"
    email "worker@epicodus.com"
    password "testtest"
  end
end
