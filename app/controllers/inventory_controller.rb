class InventoryController < ApplicationController

    get "/floorplans" do
        if logged_in?
            @user = current_user
            @inventories = Inventory.all
            erb :"floorplans/inventory"
        else 
            redirect "/login"
        end 
    end 

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

    get "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find(params[:id])
            erb :"floorplans/show"
        else 
            redirect "/login"
        end 
    end 

    get "/floorplans/:id/edit" do
        if logged_in?
            @inventory = Inventory.find(params[:id])
            if @inventory.user == current_user
                erb :"floorplans/edit"
            else 
                redirect "/floorplans"
            end 
        else 
            redirect "/login"
        end 
    end 

    patch "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find(params[:id])
            @inventory_params = new_info(params)
            @inventory.update(@inventory_params)
            redirect "/floorplans/#{@inventory.id}"
        else 
            redirect "/login"
        end 
    end 

    delete "/floorplans/:id" do
        if logged_in?
            @inventory = Inventory.find(params[:id])
            @inventory.delete
            redirect "/floorplans"
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