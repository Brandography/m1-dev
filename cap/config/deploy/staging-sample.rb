set :stage, :staging
set :branch, "set staging branch here"
server "set staging server here", user: "set staging server ssh user here", roles: %{web app db}, primary: true
set :deploy_to, "set staging deploy path here"