Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'V5prwVFUEX2FhHMp8jjZ8wCbI', 'X7hFnXSK6rT53ZJ4Fst35nMsIQy8YINYTRawwimSXEPp9nbkMh'
	#privider :linked_in
	provider :facebook, '265940623594515', '728e802ab107efeb85c09fca453e909e', :display => 'popup'

end
#Rails.application.config.middleware.use OmniAuth::Builder do
