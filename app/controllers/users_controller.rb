class UsersController < ApplicationController


   get "/signup" do
    if logged_in?
        redirect "/floorplans"
    else 
        erb :"users/signup"
    end
   end 

    post '/signup' do
        @user = User.new(params)
        # if params[:username].empty? || params[:email].empty?
        #     erb :'users/signup'
        if @user.save
            session[:user_id] = @user.id 
            redirect '/floorplans'
        else 
            redirect "/signup"
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
            flash[:message] = "Invalid username or password, Please try again!"
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
