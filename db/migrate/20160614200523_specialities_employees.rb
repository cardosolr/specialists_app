class SpecialitiesEmployees < ActiveRecord::Migration
  def change
  	create_table :specialities_employees, :id => false do |t|
  		t.integer :speciality_id
  		t.integer :employee_id
  	end
  end
end
