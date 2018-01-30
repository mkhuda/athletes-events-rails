class ApplicationController < ActionController::Base
  protect_from_forgery with: :null
  include SessionsHelper

end
