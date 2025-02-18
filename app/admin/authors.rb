ActiveAdmin.register Author do
  permit_params :name, :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs 'Author Details' do
      f.input :name
      f.input :email
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
    end
    active_admin_comments
  end
end
