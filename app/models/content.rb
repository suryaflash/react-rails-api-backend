class Content < ActiveRecord::Base
	audited only: [:title,:context] 
	has_paper_trail
end
