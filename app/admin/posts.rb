ActiveAdmin.register Post do
  # Specify permitted parameters for creating and updating posts
  permit_params :title, :description, :published_at, :author_id, :category_id, images: []

  filter :title
  filter :author
  filter :category
  filter :published_at
  filter :description_body, as: :string 

  # Index page configuration
  index do
    selectable_column
    id_column
    column :title
    column :author
    column :category
    column :published_at
    column :images do |post|
      image_tag post.images.first if post.images.attached?
    end
    actions
  end

  # Form for creating and editing a post
  form do |f|
    f.inputs 'Post Details' do
      f.input :title
      f.input :description, as: :text, input_html: { id: 'post_description' } 
      f.input :published_at, as: :datepicker
      f.input :author, as: :select, collection: Author.all.map { |a| [a.name, a.id] }
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  # Show page configuration
  show do
    attributes_table do
      row :title
      row :description
      row :published_at
      row :author
      row :category
      row :images do |post|
        post.images.map do |img|
          if img.content_type.start_with?('image/') # Check if the file is an image
            image_tag img.variant(resize_to_limit: [300, 300]).processed
          else
            "Non-image file"
          end
        end.join.html_safe
      end
    end
    active_admin_comments
  end
end
