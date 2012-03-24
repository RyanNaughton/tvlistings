module TvListingsPuller

  require 'httpclient'

  User = 'ryanjnaughton'
  Pswd = 'secret'
  TMSWebService = 'http://webservices.schedulesdirect.tmsdatadirect.com/schedulesdirect/tvlistings/xtvdService'
  ZULU_FORMAT = '%Y-%m-%dT%H:%M:%SZ'
 
  def self.get_listings
   now = Time.now.gmtime
    start_time = (now - 4.hours).strftime(ZULU_FORMAT)
    end_time = (now + 1.days).strftime(ZULU_FORMAT)

tms_SOAP = <<__EOX__
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <SOAP-ENV:Body>
        <m:download xmlns:m="urn:TMSWebServices"
                SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
            <startTime xsi:type="xsd:dateTime">#{start_time}</startTime>
            <endTime xsi:type="xsd:dateTime">#{end_time}</endTime>
        </m:download>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
__EOX__

  tms_client = HTTPClient.new
  tms_client.set_auth(TMSWebService, User, Pswd)

  chunk = tms_client.post_content(TMSWebService, tms_SOAP)
  hash = Hash.from_xml chunk
  hash["Envelope"]["Body"]["downloadResponse"]["xtvdResponse"]["xtvd"].select {|k,v| v.class==Hash}

  end

#y["Envelope"]["Body"]["downloadResponse"]["xtvdResponse"]["xtvd"]["schedules"]["schedule"]
#y["Envelope"]["Body"]["downloadResponse"]["xtvdResponse"]["xtvd"]["programs"]["program"]
#y["Envelope"]["Body"]["downloadResponse"]["xtvdResponse"]["xtvd"]["productionCrew"]["crew"]
#y["Envelope"]["Body"]["downloadResponse"]["xtvdResponse"]["xtvd"]["genres"]["programGenre"]

end
