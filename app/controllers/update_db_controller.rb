class UpdateDbController < ApplicationController

  def update_db
    listings = TvListingsPuller.get_listings
    
#stations
#{"id"=>"11517", "callSign"=>"WHUT", "name"=>"WHUT", "fccChannelNumber"=>"32", "affiliate"=>"PBS Affiliate"}

#lineup
#y["lineups"]["lineup"]["map"]
# {"station"=>"74182", "channel"=>"9", "channelMinor"=>"3"}

#schedule
#y["schedules"]["schedule"]
#{"program"=>"EP011263040593", "station"=>"19578", "time"=>"2012-01-31T05:37:00Z", "duration"=>"PT00H59M"

#programs
#y["programs"]["program"][0]
# {"id"=>"EP000001130093", "title"=>"Adam-12", "subtitle"=>"Assassination", "description"=>"A sniper attacks Reed and Malloy.", "showType"=>"Series", "series"=>"EP00000113", "syndicatedEpisodeNumber"=>"33118", "originalAirDate"=>"1971-12-08"}

  end

end
