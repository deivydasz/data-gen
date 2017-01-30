class ExportList < ApplicationRecord

	def complete
		update(status: 'completed', file_url: "file_URL_TUTI BUTO")
	end

end
