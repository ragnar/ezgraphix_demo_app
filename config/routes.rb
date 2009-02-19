ActionController::Routing::Routes.draw do |map|
  map.root :controller => "graphs"
  map.connect ':controller/:action/:id'
end
