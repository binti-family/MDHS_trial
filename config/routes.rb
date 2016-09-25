Rails.application.routes.draw do
  namespace :api do
    get "/providers" => "providers#index"
  end

  scope "(:locale)", locale: /en|es|vi/ do

    root to: "home#map"
  end
end
