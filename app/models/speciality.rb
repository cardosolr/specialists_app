class Speciality < ActiveRecord::Base
	has_and_belongs_to_many :employees, join_table: :specialities_employees
end
