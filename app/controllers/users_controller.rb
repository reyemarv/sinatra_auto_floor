class UsersController < ApplicationController


   get "/signup" do
    if logged_in?
        redirect "/floorplans"
    else 
        erb :"users/signup"
    end
   end 

    post '/signup' do
        if params[:username].empty? || params[:email].empty?
            erb :'user/signup'
        else 
            @user = User.create(params)
            session[:user_id] = @user.id 
            redirect '/floorplans'
        end 
    end 

    get '/login' do 
        erb :'users/login'
    end 

    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/floorplans"
        else 
            redirect "/login"
        end 
    end 

    get '/logout' do
        if logged_in?
            if session.clear
                redirect '/'
            else 
                redirect "/floorplans"
            end 
        else 
            redirect "/floorplans"
        end 
    end 

end 
