class CampusFoodsController < ApplicationController
  # GET /campus_foods
  # GET /campus_foods.json
  def index
    @campus_foods = CampusFood.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campus_foods }
    end
  end

  # GET /campus_foods/1
  # GET /campus_foods/1.json
  def show
    @campus_food = CampusFood.find(params[:id])
	@loc = params[:loc]
	
	@locations = Location.all(:conditions =>[ "loc like ? ", "%#{params[:loc]}%"])
	@lat = @locations[0].lat
	@lng = @locations[0].lng
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campus_food }
    end
  end

  # GET /campus_foods/new
  # GET /campus_foods/new.json
  def new
    @campus_food = CampusFood.new
	@locations = Location.all
	@temp = []
	for each in @locations
		@temp.push(each.loc.to_s)
	end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campus_food }
    end
  end

  # GET /campus_foods/1/edit
  def edit
    @campus_food = CampusFood.find(params[:id])
	
  end

  # POST /campus_foods
  # POST /campus_foods.json
  def create
    @campus_food = CampusFood.new(params[:campus_food])
	@campus_food.location = params[:tags]
    respond_to do |format|
      if @campus_food.save
        format.html { redirect_to campus_foods_path, notice: 'Campus food was successfully created.' }
        format.json { render json: @campus_food, status: :created, location: @campus_food }
      else
        format.html { render action: "new" }
        format.json { render json: @campus_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campus_foods/1
  # PUT /campus_foods/1.json
  def update
    @campus_food = CampusFood.find(params[:id])
	@campus_food.location = params[:tags]
    respond_to do |format|
      if @campus_food.update_attributes(params[:campus_food])
        format.html { redirect_to campus_foods_path, notice: 'Campus food was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @campus_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus_foods/1
  # DELETE /campus_foods/1.json
  def destroy
    @campus_food = CampusFood.find(params[:id])
    @campus_food.destroy

    respond_to do |format|
      format.html { redirect_to campus_foods_url }
      format.json { head :ok }
    end
  end
end
