module ApplicationHelper

  def formatDate(date, horario)
    if horario
      date.strftime("%b-%d-%Y %I:%M%p")
    else
      date.strftime("%b-%d-%Y")
    end
  end
end
