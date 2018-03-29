class Event < ApplicationRecord

	validates :name, presence: { :message => "This field is required." }
	validates :location, presence: { :message => "This field is required." }
	validates :date, presence: { :message => "This field is required." }
end
