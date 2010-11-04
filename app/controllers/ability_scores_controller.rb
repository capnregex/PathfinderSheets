class AbilityScoresController < ApplicationController
  # GET /ability_scores
  # GET /ability_scores.xml
  def index
    @ability_scores = AbilityScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ability_scores }
    end
  end

  # GET /ability_scores/1
  # GET /ability_scores/1.xml
  def show
    @ability_score = AbilityScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ability_score }
    end
  end

  # GET /ability_scores/new
  # GET /ability_scores/new.xml
  def new
    @ability_score = AbilityScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ability_score }
    end
  end

  # GET /ability_scores/1/edit
  def edit
    @ability_score = AbilityScore.find(params[:id])
  end

  # POST /ability_scores
  # POST /ability_scores.xml
  def create
    @ability_score = AbilityScore.new(params[:ability_score])

    respond_to do |format|
      if @ability_score.save
        format.html { redirect_to(@ability_score, :notice => 'Ability score was successfully created.') }
        format.xml  { render :xml => @ability_score, :status => :created, :location => @ability_score }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ability_score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ability_scores/1
  # PUT /ability_scores/1.xml
  def update
    @ability_score = AbilityScore.find(params[:id])

    respond_to do |format|
      if @ability_score.update_attributes(params[:ability_score])
        format.html { redirect_to(@ability_score, :notice => 'Ability score was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ability_score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ability_scores/1
  # DELETE /ability_scores/1.xml
  def destroy
    @ability_score = AbilityScore.find(params[:id])
    @ability_score.destroy

    respond_to do |format|
      format.html { redirect_to(ability_scores_url) }
      format.xml  { head :ok }
    end
  end
end
