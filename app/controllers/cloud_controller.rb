class CloudController < ApplicationController
    def index
        @words = Word.where(:deleted => false, :cloud => params[:cloud]).order('count desc').limit(1000)
        respond_to do |format|
            format.html
        end
    end
end
