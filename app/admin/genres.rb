ActiveAdmin.register Genre do
  permit_params :name
  config.sort_order = 'name_asc'
  config.filters = false

  index do 
    column :name
    actions
  end
  
end
