class DivController < WebsocketRails::BaseController
	
	def initialize_session
	controller_store[:channel_q] = 0
	end

	def update
		WebsocketRails['channel_name'].trigger('catch', message)
	end

	def init
		process = { :id => controller_store[:channel_q] , :length => controller_store[:channel_q] } 
		controller_store[:channel_q] = controller_store[:channel_q] + 1
		WebsocketRails['channel_name'].trigger('verified', process)
	end
end
