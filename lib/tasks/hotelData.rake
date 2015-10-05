namespace :hotelData do 
	desc 'this rake task uploads data on hotels near Times Square'
		task :get_and_upload_hotel_data => :environment do 
			puts 'reading in CSV'
			require 'csv'
			@hotels = CSV.parse(IO.read('Hotel_Data.csv'), :headers=>true, 
   				:header_converters=> lambda {|f| f.strip},
   				:converters=> lambda {|f| f ? f.strip : nil})
			@hotels.each do |row|
				Hotel.create!(row.to_hash)
			end
		end

end