module ApplicationHelper

  def formatDate(date, horario)
    if horario
      date.strftime("%b-%d-%Y %I:%M%p")
    else
      date.strftime("%b-%d-%Y")
    end
  end

  def link_to_add_specialities(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |ff|
			render(association.to_s + "_fields", ff: ff)
		end
		link_to(name, '#', class: "add_specialities", data: {id: id, fields: fields.gsub("\n", "")})
	end 
end
