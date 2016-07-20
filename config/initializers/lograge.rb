DataDriven::Application.configure do
 config.lograge.enabled = true

 config.lograge.custom_options = lambda do |event|
   {:time => event.time}
 end

	config.lograge.formatter = Lograge::Formatters::Logstash.new
end