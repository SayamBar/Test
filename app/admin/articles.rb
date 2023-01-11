ActiveAdmin.register Article do
  permit_params :title,:body,:publish_at,:user_id
  scope :all
  scope :created

  index do
    id_column
    column :title
    actions
  end

  index as: :grid do |article|
    link_to article.title, admin_article_path(article)
  end

  index as: :block do |article|
    div for: article do
      resource_selection_cell article
      h2  auto_link     article.title
      div simple_format article.body
    end
  end

  index as: :blog do
    title
  end
  

  filter :title
  filter :created_at

  action_item :view,only: :show do
    link_to "view on site", article_path(article) 
  end

  member_action :published, method: :put do
    article = Article.find(params[:id])
    article.update(publish_at: Time.zone.now)
    redirected_to admin_article_path(article)
  end

  csv force_quotes: true, col_sep: ';', column_names: false do
    column :title
    column(:body) 
  end


  # collection_action :all, method: :post do
  #   redirected_to admin_path, notice: "Working"
  # end
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :writer
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :writer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
