ActiveAdmin.register Casebank do
  permit_params :title, :difficulty, :is_brainstorm, :num_exhibits, :casebook_id, :is_math_heavy, :case_type, :industry, :is_interviewer_led

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
