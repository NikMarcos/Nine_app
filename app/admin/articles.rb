ActiveAdmin.register Article do

   form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :theme
      f.input :pictures, as: :text
    end
    f.actions
  end

  scope :after_2019_04_29 do |article|
    article.where('created_at > ?', '2019-04-29')
  end

  scope :all do |article|
    article.all
  end

  permit_params :title, :body, :pictires, :theme

end
