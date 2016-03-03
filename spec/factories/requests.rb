FactoryGirl.define do
  factory :request do
    trap_id "MyString"
remote_ip "MyString"
request_method "MyString"
scheme "MyString"
query_string "MyText"
query_params "MyText"
cookies "MyText"
headers "MyText"
raw_response "MyText"
  end

end
