module TwilioSender

  require 'twilio-ruby'

  def self.client
    account_sid = 'APff89888d945740cda0cec8c795928ed2'
    auth_token = ''

    # set up a client to talk to the Twilio REST API
    Twilio::REST::Client.new account_sid, auth_token
  end
  
  def self.send_sms(restaurant, to, body)
    client.account.sms.messages.create(
      :from => restaurant.smsNum,
      :to => ("+1" + to),
      :body => body
    )
  end

end

