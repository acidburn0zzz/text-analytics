class PhrasesController < ApplicationController
  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phrases }
    end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phrase }
    end
  end

    # GET /phrases/new
    # GET /phrases/new.json
    def new
        @brain_names = Array.new    
        @phrase = Phrase.new
        @brains = Brain.find(:all)
        @brains.each do |brain|
            @brain_names << [brain.name, brain.id]
        end

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @phrase }
        end
    end

  # GET /phrases/1/edit
  def edit
    @phrase = Phrase.find(params[:id])
  end

    # POST /phrases
    # POST /phrases.json
    def create
        # cgi post
        if params[:brain_name]
            @brain = Brain.where(:name => params[:brain_name]).first
            @phrase = Phrase.new(:text => params[:text],
                                 :category => params[:category],
                                 :brain_id => @brain.id)
        # xml post
        elsif params[:phrase][:brain_name] 
            @brain = Brain.where(:name => params[:phrase][:brain_name]).first
            @phrase = Phrase.new(:text => params[:phrase][:text],
                                 :category => params[:phrase][:category],
                                 :brain_id => @brain.id)
        # web form
        else
            @brain = Brain.find(params[:phrase][:brain_id])
            @phrase = Phrase.new(params[:phrase])
        end

        respond_to do |format|
            if @phrase.save
                classifier = YAML.load(@brain.classifier)
                classifier.add_item(@phrase.text, @phrase.category)
                @brain.classifier = YAML.dump(classifier)
                @brain.save

                format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
                format.json { render json: @phrase, status: :created, location: @phrase }
                format.xml { render xml: @phrase, status: :created, location: @phrase }
            else
                format.html { render action: "new" }
                format.json { render json: @phrase.errors, status: :unprocessable_entity }
                format.xml { render xml: @phrase.errors, status: :unprocessable_entity }
            end
        end
    end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      if @phrase.update_attributes(params[:phrase])
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to phrases_url }
      format.json { head :no_content }
    end
  end
end
