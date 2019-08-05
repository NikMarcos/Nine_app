ActiveAdmin.register User do

  scope :all
  scope :admin
  scope :user
  scope :without_name do |users|
    users.where('name = ? OR name IS NULL', '')
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
    column :created_at
    column :updated_at
    column :images
    column :musics
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :role
      row :created_at
      row :updated_at
      row "Images" do
        ol do
          user.images.each do |img|
            li do
              image_tag(img.pic.url(:thumb))
            end
          end
        end
      end
        row "Musics" do
          ol do
            user.musics.each do |track|
              li do
                audio_tag track.track.url, preload: 'auto', controls: true
              end
            end
          end
        end
    end
  end

  filter :name
  filter :email
  filter :created_at

  action_item :newAdmin, only: :show do
    link_to 'Change to Admin', newAdmin_admin_user_path(user), method: :put if user.role == "user"
  end

  member_action :newAdmin, method: :put do
      user = User.find(params[:id])
      user.update(role: 'admin')
      redirect_to admin_user_path(user)
    end

    action_item :newUser, only: :show do
      link_to 'Change to User', newUser_admin_user_path(user), method: :put if user.role == "admin"
    end

    member_action :newUser, method: :put do
        user = User.find(params[:id])
        user.update(role: 'user')
        redirect_to admin_user_path(user)
    end

permit_params :name, :email

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'update' && current_user.admin?
#   permitted
# end

end
