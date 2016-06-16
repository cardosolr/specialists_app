class Employee < ActiveRecord::Base
	has_and_belongs_to_many :specialities, join_table: :specialities_employees
	accepts_nested_attributes_for :specialities, :allow_destroy => true

	attr_accessor :specialities_build_attributes
end
