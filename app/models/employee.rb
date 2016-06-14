class Employee < ActiveRecord::Base
	has_and_belongs_to_many :specialities, join_table: :specialities_employees
end
