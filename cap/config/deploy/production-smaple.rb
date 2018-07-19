set :stage, :production
set :branch, "set production branch here"
server "set server here", user: "set ssh user here", roles: %{web app db}, primary: true
set :deploy_to, "set deploy path here"