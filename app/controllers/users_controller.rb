class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def login
  
  end
  
  def signIn
    session[:current_user_id] = nil
    session[:admin_user] = nil
    @user = User.find_by_uname(params[:uname])
    if @user == nil || !@user.authenticate(params[:uname], params[:password])
      flash[:alert] = "Unable to log in to the system. Please check your credentials"
      #redirect_to :action => "index"
    elsif @user.authenticate(params[:uname], params[:password])
      session[:current_user_id] = @user.id
      flash[:notice] = "Successfully Logged in"
      if @user.admin?
        session[:admin_user] = true
        flash[:notice] = "Admin logged in"
      end
      redirect_to(:controller => "campus_foods", :action => "index")
      end
  end

  def logout
    session[:current_user_id] = nil
    session[:admin_user]= nil
    flash[:alert] = "Successfully Logged out"
    redirect_to :action => "index"
  end	
	
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
