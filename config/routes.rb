Rails.application.routes.draw do
  post 'calculator/add', to: 'calculator#add'
end
