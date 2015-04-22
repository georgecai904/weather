require 'nokogiri'
require 'open-uri'
require 'json'

class CoreController < ApplicationController
  def index
    @reports = Report.all
    @periods = Period.all
    respond_to do |format|
      format.html { render :template => "core/home" }
    end
  end
end
