class AuditLog < ActiveRecord::Base
	enum status: { pending: 0, confirmed: 1 }
	belongs_to :user

	validates_presence_of :status, :start_date, :user_id

	after_initialize :set_start_date

	private

	def set_start_date
		self.start_date ||= Date.today - 6.days
	end
end
