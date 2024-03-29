class CampusFoodsController < ApplicationController
  # GET /campus_foods
  # GET /campus_foods.json
  def index
    @campus_foods = CampusFood.all
    #for each in @campus_foods
     # each.start.to_time
      #each.end.to_time
    #end
    #@campus_foods.sort_by(&:start)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campus_foods }
    end
  end

   def today
    #@campus_foods = CampusFood.find_all_by_date(Date.today)
     @campus_foods = CampusFood.all(:conditions => ["date = ?",Date.today] ,:order => 'date,start')
    #for each in @campus_foods
     # each.start.to_time
      #each.end.to_time
    #end
    #@campus_foods.sort_by(&:start)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campus_foods }
    end
   end

  def future
    @campus_foods = CampusFood.all(:conditions => ["date > ?",Date.today],:order => 'date,start')
    #for each in @campus_foods
     # each.start.to_time
      #each.end.to_time
    #end
    #@campus_foods.sort_by(&:start)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campus_foods }
    end
  end

  def search
    @food = params[:food]
    @results = CampusFood.find(:all, :conditions => ["food like ?", "%#{@food}%"])
    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @results }
    end
  end
  # GET /campus_foods/1
  # GET /campus_foods/1.json
  def show
    @campus_food = CampusFood.find(params[:id])
	@loc = params[:loc]
	
	@locations = Location.all(:conditions =>[ "loc like ? ", "%#{params[:loc]}%"])
	if !@locations.empty?
   @lat = @locations[0].lat
   @lng = @locations[0].lng
  end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @locations }
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
    @temp = []
    @locations = Location.all
    if !@locations.nil?
      for each in @locations
        @temp.push(each.loc.to_s)
      end
    end

  end

  # POST /campus_foods
  # POST /campus_foods.json
  def create
    @campus_food = CampusFood.new(params[:campus_food])
	#@campus_food.location = params[:tags]
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
