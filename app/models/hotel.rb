class Hotel
  include Mongoid::Document
  
  field :'Company Name', type: String
  field :'Phone', type: String
  field :'Website', type: String
  field :'Location 1', type: String
end
