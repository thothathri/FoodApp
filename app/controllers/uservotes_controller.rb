class UservotesController < ApplicationController
  # GET /uservotes
  # GET /uservotes.json
  def index
    @uservotes = Uservote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uservotes }
    end
  end

  # GET /uservotes/1
  # GET /uservotes/1.json
  def show
    @uservote = Uservote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uservote }
    end
  end

  # GET /uservotes/new
  # GET /uservotes/new.json
  def new
    @uservote = Uservote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uservote }
    end
  end

  # GET /uservotes/1/edit
  def edit
    @uservote = Uservote.find(params[:id])
  end

  # POST /uservotes
  # POST /uservotes.json
  def create
    @uservote = Uservote.new(params[:uservote])
    fuid =      params[:uservote][:fuid]
    eventid =    params[:uservote][:eventid]
    @entry = Uservote.find(:all,:conditions=> ["fuid like ? and eventid like ? ", "#{fuid}","#{eventid}"])
    Rails.logger.info("fuid is #{fuid}, event id is : #{eventid}, entry is #{@entry}")
    if !@entry.empty?
           render :json => { :status => :error, :message => "Duplicate entry" }.to_json, :status => 400
    else
      respond_to do |format|
      if @uservote.save
        format.html { redirect_to @uservote, notice: 'Uservote was successfully created.' }
        format.json { render json: @entry, status: :created, location: @uservote }
      else
        format.html { render action: "new" }
        format.json { render json: @uservote.errors, status: :unprocessable_entity }
      end
      end

    end

  end

  # PUT /uservotes/1
  # PUT /uservotes/1.json
  def update
    @uservote = Uservote.find(params[:id])

    respond_to do |format|
      if @uservote.update_attributes(params[:uservote])
        format.html { redirect_to @uservote, notice: 'Uservote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @uservote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uservotes/1
  # DELETE /uservotes/1.json
  def destroy
    @uservote = Uservote.find(params[:id])
    @uservote.destroy

    respond_to do |format|
      format.html { redirect_to uservotes_url }
      format.json { head :ok }
    end
  end
end
