class CloudController < ApplicationController
    http_basic_authenticate_with :name => "boomi", :password => "b00m1"
    def index
        @words = Word.where(:deleted => false, :cloud => params[:cloud]).order('count desc').limit(1000)
        respond_to do |format|
            format.html
        end
    end

    def delete
        Word.delete_all(:cloud => params[:cloud])
        respond_to do |format|
            format.html { redirect_to :words, notice: 'Cloud was successfully deleted.' }
        end
    end

    def list
        @words = Word.where(:cloud => params[:cloud]).order('count desc').limit(1000)
        respond_to do |format|
            format.html
        end
    end
end
