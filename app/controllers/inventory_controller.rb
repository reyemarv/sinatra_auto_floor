class InventoryController < ApplicationController

   #Create
   
    get "/floorplans/new" do
        if logged_in?
            erb :"floorplans/new"
        else 
            redirect "/login"
        end 
    end 

    post "/floorplans" do
        @inventory = current_user.inventories.build(params)
        if @inventory.save 
            redirect "/floorplans"
        else 
            erb :"floorplans/new"
        end 
    end 

    # Read 

    get "/floorplans" do
        if logged_in?
            @user = current_user
            @inventories = Inventory.where(user_id: @user.id)
            erb :"floorplans/inventory"
        else 
            redirect "/login"
        end 
    end 

    get "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find_by_id(params[:id])
            erb :"floorplans/show"
        else 
            redirect "/login"
        end 
    end 


    #Update

    get "/floorplans/:id/edit" do
        if logged_in?
            @inventory = Inventory.find_by_id(params[:id])
            if @inventory.user == current_user
                erb :"floorplans/edit"
            else 
                redirect "/floorplans/#{@inventory.id}"
            end 
        else 
            redirect "/login"
        end 
    end 


    patch "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find_by_id(params[:id])
            @inventory_params = new_info(params)
            if @inventory.update(@inventory_params)
                redirect "/floorplans/#{@inventory.id}"
            else 
                erb :"/floorplans/edit"
            end 
        else 
            redirect "/login"
        end 
    end 

    #Delete

    delete "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find_by_id(params[:id])
            if @inventory.user == current_user 
                @inventory.delete
                redirect "/floorplans"
            else 
                redirect "/floorplans/#{@inventory.id}"
            end 
        else 
            redirect "/login"
        end 
    end 

    private 

    def new_info(params)
        {
            year: params[:year],
            make: params[:make],
            model: params[:model],
            color: params[:color],
            amount: params[:amount]
        }
    end 

end 