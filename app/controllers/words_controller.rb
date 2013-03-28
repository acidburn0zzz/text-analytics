class WordsController < ApplicationController
    http_basic_authenticate_with :name => "boomi", :password => "b00m1"

    def seed
        word_array = []
        File.open("big.txt") do |f|
            f.readlines.each do |line|
                line.gsub(/[^\w\s]/, '').downcase.split.each do |word|
                    word_array << word
                end
            end
        end
        word_array.each do |word|
            foo = Word.where(:text => word.downcase, :cloud => 'test').first_or_create()
            if foo.count == nil
                foo.count = 1
            else
                foo.count += 1
            end
            foo.deleted = false
            foo.save
        end
    end

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
    @clouds = Word.select(:cloud).uniq

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/new
  # GET /words/new.json
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.json
  def create
    word_array = params[:text].gsub(/[^\w\s]/, '').downcase.split
    word_array.each do |word|
        foo = Word.where(:text => word.downcase, :cloud => params[:cloud]).first_or_create()
        if foo.count == nil
            foo.count = 1
        else
            foo.count += 1
        end
        foo.deleted = false
        foo.save
    end

=begin
    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action: "new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PUT /words/1
  # PUT /words/1.json
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /words/1/delete
  def delete
      @word = Word.find(params[:id])
      @word.deleted = true
      @word.save
      redirect_to :cloud => @word.cloud, :controller => 'cloud', :action => 'index'
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end
end
