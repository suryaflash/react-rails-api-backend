Rails.application.routes.draw do

  resources :articles

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'



  

  post 'user/sign_in' , to:'userdatum_token#create'

  get 'user/sign_in' , to:'articles#signin'  

  post 'user/sign_up' , to:'articles#signup'

  get 'user/sign_up' , to:'articles#signup' 

  post 'articles/update' , to:'articles#update'

  get 'articles/update' , to:'articles#update'  

  post 'articles/edit' , to:'articles#edit'

  get 'articles/edit' , to:'articles#edit'

  post 'articles/findEdit' , to:'articles#findEdit'

  get 'articles/findEdit' , to:'articles#findEdit'
      
  post 'articles/history' , to:'articles#history'

  post 'articles/latest' , to:'articles#latest'

  get 'articles/latest' , to:'articles#latest'

end


# article_index GET    /article(.:format)          article#index
#               POST   /article(.:format)          article#create
#   new_article GET    /article/new(.:format)      article#new
#  edit_article GET    /article/:id/edit(.:format) article#edit
#       article GET    /article/:id(.:format)      article#show
#               PATCH  /article/:id(.:format)      article#update
#               PUT    /article/:id(.:format)      article#update
#               DELETE /article/:id(.:format)      article#destroy




  # articles GET    /articles(.:format)          articles#index
  #                POST   /articles(.:format)          articles#create
  #    new_article GET    /articles/new(.:format)      articles#new
  #   edit_article GET    /articles/:id/edit(.:format) articles#edit
  #        article GET    /articles/:id(.:format)      articles#show
  #                PATCH  /articles/:id(.:format)      articles#update
  #                PUT    /articles/:id(.:format)      articles#update
  #                DELETE /articles/:id(.:format)      articles#destroy




 # get 'article/index' ,to:'article#index'

  # post 'article/new' ,to: 'article#new' 

  # get 'article/new' ,to:'article#new'

  # post 'article/delete' , to:'article#delete'

  # get 'article/delete' , to:'article#delete'

  # post 'article/find' , to:'article#find'

  # get 'article/find' , to:'article#find'