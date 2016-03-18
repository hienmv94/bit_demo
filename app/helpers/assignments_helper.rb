module AssignmentsHelper

  def check_timeout?(assignment)
    assignment.due_date < Time.now.to_date 
  end

  def assignment_date assignment
    if assignment.due_date < Time.now.to_date 
      content_tag :div, "#{assignment.due_date}", class: ["text-danger"]
  	else
      content_tag :div, "#{assignment.due_date}", class: ["text"]
    end 
  end
end