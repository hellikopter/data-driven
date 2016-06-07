class ConceptsController < ApplicationController

	def index
		@concepts = Concept.all.limit(100).resources
	end

	def show
		concept_id = params[:id]
		concept_uri = "http://data.parliament.uk/resource/#{concept_id}"
		@concept = Concept.find(concept_uri)
		@tabling_members = Person.ordered_tabling_members_on_subject(concept_uri)
	end
end
