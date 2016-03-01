class Request < ActiveRecord::Base
  serialize  :headers, HASH
  serialize  :cookies, HASH
  serialize  :query_params, HASH

end
