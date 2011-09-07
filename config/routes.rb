NeedOTron::Application.routes.draw do
  resources :needs do
    collection do
      resource :imports, :only => [:new, :create]
    end
    resources :justifications, :existing_services, :directgov_links, :accountabilities
    resources :fact_checkers do
      collection do
        get :search
      end
    end
  end

  root :to => "needs#index", :defaults => { :in_state => 'new' }
end
