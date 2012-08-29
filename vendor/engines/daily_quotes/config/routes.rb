::Refinery::Application.routes.draw do
  resources :daily_quotes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :daily_quotes, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
